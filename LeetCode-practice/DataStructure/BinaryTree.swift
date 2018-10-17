//
//  BinaryTree.swift
//  LeetCode-practice
//
//  Created by dzw on 2018/9/30.
//  Copyright © 2018年 dzw. All rights reserved.
//  最简单的二叉树
//

import UIKit


class BinaryTree: NSObject {
    
    public var leftNode :BinaryTree?
    public var rightNode:BinaryTree?
    public var val:Int = 0
    
    /// 通过数组构造二叉树
    /// eg：let bTree = BinaryTree().createBinaryTree(array: arr)
    /// - Parameter array: 数组
    /// - Returns: 二叉树，数组第一个元素作为根节点
    func createBinaryTree(array:[Int]) -> BinaryTree? {
        guard array.count > 0 else {return nil}
        var rootNode:BinaryTree?
        for value in array {
            rootNode = self.AddTreeNode(node: &rootNode,value)
        }
        return rootNode!
    }
    
    @discardableResult func AddTreeNode(node: inout BinaryTree?, _ value:Int) -> BinaryTree {
        if (node == nil) {
            node = BinaryTree()
            node?.val = value
        }else if (value < (node?.val)!) {
             AddTreeNode(node: &node!.leftNode, value)
        }else{
             AddTreeNode(node: &node!.rightNode, value)
        }
        return node!
    }
}

extension BinaryTree{
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
extension BinaryTree {
    func reverse() {
        self.swapNode(left: &leftNode, right: &rightNode)
        leftNode?.reverse()
        rightNode?.reverse()
    }
    private func swapNode(left:inout BinaryTree?,right: inout BinaryTree?) {
        let rightNode = right
        right = left
        left = rightNode
        
    }
}



///遍历结果
private var traverseReult : NSMutableArray = []

extension BinaryTree {
    public func getInorderResult() -> NSMutableArray{
        traverseReult.removeAllObjects()
        self.inOrder()
        return traverseReult
    }
    private func inOrder(){
        leftNode?.inOrder()
        traverseReult.add("\(val)")
        rightNode?.inOrder()
    }
}

