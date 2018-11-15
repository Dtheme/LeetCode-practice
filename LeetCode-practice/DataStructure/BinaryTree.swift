//
//  BinaryTree.swift
//  LeetCode-practice
//
//  Created by dzw on 2018/9/30.
//  Copyright © 2018年 dzw. All rights reserved.
//  最简单的二叉树
//

import Foundation


public class BinaryTreeNode<T:Comparable> {
    
    public var value:T
    public var leftNode:BinaryTreeNode?
    public var rightNode:BinaryTreeNode?
    public weak var parent:BinaryTreeNode?
    
    
    /// 遍历构造方法
    ///
    /// - Parameter value: 节点值 类型：T
    public convenience init(value: T) {
        self.init(value: value, left: nil, right: nil, parent:nil)
    }
    
    public init(value:T, left:BinaryTreeNode?, right:BinaryTreeNode?,
                parent:BinaryTreeNode?) {
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
                let newNode = BinaryTreeNode(value: value)
                newNode.parent = self
                leftNode = newNode
            }
        } else {
            
            if let rightChild = rightNode {
                rightChild.addNode(value: value)
            } else {
                let newNode = BinaryTreeNode(value: value)
                newNode.parent = self
                rightNode = newNode
            }
        }
    }
}


extension BinaryTreeNode{
    ///深度
    func depth() -> Int {
        return 1 + max((leftNode != nil ? leftNode!.depth() : 0), (rightNode != nil ? rightNode!.depth() : 0))
    }
    
    ///当前树总节点数
    func length() -> Int {
        return 1 + (leftNode != nil ? leftNode!.length() : 0) + (rightNode != nil ? rightNode!.length() : 0)
    }
    
    ///满二叉树节点数
    func maxLength() -> Int {
        var depth = self.depth()
        var maxLength = 0
        while depth > 0 {
            maxLength = (maxLength) + Int(pow(2.0,Double(depth - 1)))
            depth = depth - 1;
        }
        return maxLength
    }
}


//MARK: -  反转
extension BinaryTreeNode {
    func reverse() {
        self.swapNode(left: &leftNode, right: &rightNode)
        leftNode?.reverse()
        rightNode?.reverse()
    }
    private func swapNode(left:inout BinaryTreeNode?,right: inout BinaryTreeNode?) {
        let rightNode = right
        right = left
        left = rightNode
    }
}


///遍历结果
private var traverseReult : NSMutableArray = []

extension BinaryTreeNode {
    public func getInorderResult() -> NSMutableArray{
        traverseReult.removeAllObjects()
        self.inOrder()
        return traverseReult
    }
    private func inOrder(){
        leftNode?.inOrder()
        traverseReult.add("\(value)")
        rightNode?.inOrder()
    }
}



