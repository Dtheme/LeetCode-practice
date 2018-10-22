//
//  BinarySearchTree.swift
//  LeetCode-practice
//
//  Created by dzw on 2018/10/17.
//  Copyright © 2018年 dzw. All rights reserved.
//  二叉搜索树
//

import UIKit

enum traverseBinaryTreeType {
    case InOrder          //中序递归遍历
    case PreOrder         //先序递归遍历
    case PostOrder        //后序递归遍历
    case BreadthFirst     //广度优先遍历
}

private var traverseReult : NSMutableArray = []

public class BinarySearchTreeNode<T:Comparable> {
    
    public var value:T
    public var leftNode:BinarySearchTreeNode?
    public var rightNode:BinarySearchTreeNode?
    public weak var parent:BinarySearchTreeNode?
    
    
    /// 便利构造方法
    /// - Parameter value: 节点值
    public convenience init(value: T) {
        self.init(value: value, left: nil, right: nil, parent:nil)
    }
    
    public init(value:T, left:BinarySearchTreeNode?, right:BinarySearchTreeNode?,
                parent:BinarySearchTreeNode?) {
        self.value = value
        self.leftNode = left
        self.rightNode = right
        self.parent = parent
    }
    
    
    /// 添加节点
    /// 节点值比根节点小时，插入到左节点，比根节点大插入到右节点
    /// - Parameter value: 节点值 类型：T
    public func addNode(value:T) {
        // if let _ = self.parent { return }
        if value < self.value {
           
            if let leftChild = leftNode {
                leftChild.addNode(value: value)
            } else {
                let newNode = BinarySearchTreeNode(value: value)
                newNode.parent = self
                leftNode = newNode
            }
        } else {
           
            if let rightChild = rightNode {
                rightChild.addNode(value: value)
            } else {
                let newNode = BinarySearchTreeNode(value: value)
                newNode.parent = self
                rightNode = newNode
            }
        }
    }

    /// 遍历二叉树
    ///
    /// - Parameters:
    ///   - node: 遍历起始节点
    ///   - type: 遍历方式
    /// - Returns: 返回遍历结果数组
    class func traverse(node:BinarySearchTreeNode?,type:traverseBinaryTreeType) -> NSMutableArray{

        traverseReult.removeAllObjects()

        switch type {
        case .InOrder:
            BinarySearchTreeNode.inOrder(node: node)
            break
        case .PreOrder:
            BinarySearchTreeNode.preOrder(node: node)
            break
        case .PostOrder:
            BinarySearchTreeNode.postOrder(node: node)
            break
        case .BreadthFirst:
            BinarySearchTreeNode.breadthFirst(node: node)
            break
        }

        return traverseReult
    }

    private class func inOrder(node:BinarySearchTreeNode?) {

        guard let node = node else {
            return
        }

        BinarySearchTreeNode.inOrder(node: node.leftNode)
        traverseReult.add(node.value)
        BinarySearchTreeNode.inOrder(node: node.rightNode)
        
    }

    private class func preOrder(node:BinarySearchTreeNode?) {
        
        guard let node = node else {
            return
        }
        
        traverseReult.add(node.value)
        BinarySearchTreeNode.preOrder(node: node.leftNode)
        BinarySearchTreeNode.preOrder(node: node.rightNode)
        
    }

    private class func postOrder(node:BinarySearchTreeNode?) {
        
        guard let node = node else {
            return
        }
        
        BinarySearchTreeNode.postOrder(node: node.leftNode)
        BinarySearchTreeNode.postOrder(node: node.rightNode)
        traverseReult.add(node.value)
        
    }
    //使用队列实现
    private class func breadthFirst(node:BinarySearchTreeNode?) {
        if (node == nil) { return }
        var queue = Queue<BinarySearchTreeNode>()
        queue.enqueue(element: node!)
        while !queue.isEmpty() {
            let node = queue.dequeue()
            traverseReult.add(node?.value as Any)
            if node?.leftNode != nil{
                queue.enqueue(element: (node?.leftNode)!)
            }
            if node?.rightNode != nil{
                queue.enqueue(element: (node?.rightNode)!)
            }
        }
    }
    
    /// 某个节点的深度
    ///eg：rootNode.nodeDepth() ans:0
    /// - Returns: 某个节点的深度 Int
    public func nodeDepth() -> Int {
        guard var node = parent else {
            return 0
        }
        
        var depth = 1
        while let parent = node.parent {
            depth = depth + 1
            node = parent
        }
        
        return depth
    }
    
    ///以某个节点为根节点检索树深度
    /// eg: 根节点的左子节点为根节点 下面子树的深度 rootNode.leftNode?.depth()
    ///     找完整树的深度rootNode.depth()
    func depth() -> Int {
        return 1 + max((leftNode != nil ? leftNode!.depth() : 0), (rightNode != nil ? rightNode!.depth() : 0))
    }
    
    ///某个节点子总节点数
    func length() -> Int {
        return 1 + (leftNode != nil ? leftNode!.length() : 0) + (rightNode != nil ? rightNode!.length() : 0)
    }
}

//MARK: -  反转
extension BinarySearchTreeNode {
    func reverse() {
        self.swapNode(left: &leftNode, right: &rightNode)
        leftNode?.reverse()
        rightNode?.reverse()
    }
    private func swapNode(left:inout BinarySearchTreeNode?,right: inout BinarySearchTreeNode?) {
        let rightNode = right
        right = left
        left = rightNode
    }
}


//MARK: -  搜索、删除等操作
extension BinarySearchTreeNode{
    public func search(value:T) -> BinarySearchTreeNode? {
        if value == self.value {
            return self
        }
        
        //如果小于当前节点的值，递归查找左节点，如果大于的话找右节点
        if value < self.value {
            guard let left = leftNode else {
                return nil
            }
            return left.search(value: value)
        } else {
            guard let right = rightNode else {
                return nil
            }
            return right.search(value: value)
        }
    }
    
    
    /// 删除节点 找到用来替换的节点，链接新节点的父节点和左右节点，删除需要删除的节点
    public func delete() {
        if let left = leftNode {
            
            if let _ = rightNode {
                self.exchangeWithSuccessor()
            } else {
                self.connectParentTo(child: left)
            }
            
        } else if let right = rightNode {
            self.connectParentTo(child: right)
        } else {
            self.connectParentTo(child: nil)
        }
        
        self.parent = nil
        self.leftNode = nil
        self.rightNode = nil
    }
    
    
    //交换 要删除的节点<--->删除以后要放到这个地方的节点
    private func exchangeWithSuccessor() {
        guard let right = self.rightNode , let left = self.leftNode
            else {
                return
        }
        let successor = right.minimum()
        successor.delete()
        
        
        successor.leftNode = left
        left.parent = successor
        
        
        if right !== successor {
            successor.rightNode = right
            right.parent = successor
        } else {
            successor.rightNode = nil
        }
        
        self.connectParentTo(child: successor)
    }
    

    private func connectParentTo(child:BinarySearchTreeNode?) {
        guard let parent = self.parent else {
            child?.parent = self.parent
            return
        }
        if parent.leftNode === self {
            parent.leftNode = child
            child?.parent = parent
        }else if parent.rightNode === self {
            parent.rightNode = child
            child?.parent = parent
        }
    }
  
    
    ///搜索树中的最小值
    public func minimumValue() -> T {
        if let left = leftNode {
            return left.minimumValue()
        }else {
            return value
        }
    }
    
    
    ///搜索树中的最大值
    public func maximumValue() -> T {
        if let right = rightNode {
            return right.maximumValue()
        }else {
            return value
        }
    }
    
    
    
    ///最小值节点
    public func minimum() -> BinarySearchTreeNode {
        if let left = leftNode {
            return left.minimum()
        }else {
            return self
        }
    }
    
    
    ///最大值节点
    public func maximum() -> BinarySearchTreeNode {
        if let right = rightNode {
            return right.maximum()
        }else {
            return self
        }
    }
    
    
}




