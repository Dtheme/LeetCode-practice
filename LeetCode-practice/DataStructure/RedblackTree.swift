//
//  RedblackTree.swift
//  LeetCode-practice
//
//  Created by dzw on 2018/10/22.
//  Copyright © 2018年 dzw. All rights reserved.
//
//  红黑树：特殊的二叉查找树（未完成）
//
//  1、每个节点都有一个颜色，红或者黑
//  2、根节点为黑
//  3、所有的空节点NULL/nil是黑
//  4、红节点的子节点是黑
//  5、从任一节点开始，到其每个子节点的所有路径都包含相同数目的黑色节点。
//  搜索：平均时间复杂度，最坏情况时间复杂度 O(log(n))
//  插入：平均时间复杂度，最坏情况时间复杂度 O(log(n))
//  删除：平均时间复杂度，最坏情况时间复杂度 O(log(n))
//  空间复杂度：平均时间复杂度，最坏情况时间复杂度 O(n)

import Foundation

public enum TreeNodeColor : Int {
    case red = 0
    case black = 1
}

public class RedBlackTreeNode<T:Comparable> {
    public var value:T
    public var leftNode:RedBlackTreeNode?
    public var rightNode:RedBlackTreeNode?
    public weak var parent:RedBlackTreeNode?

    public var nodeColor:TreeNodeColor

    ///遍历构造方法
    public convenience init(value: T ,nodeColor: TreeNodeColor) {
        self.init(value: value, left: nil, right: nil, parent:nil,
                  nodeColor: TreeNodeColor.black)
    }

    public init(value:T, left:RedBlackTreeNode?,
                right:RedBlackTreeNode?, parent:RedBlackTreeNode?,
                nodeColor:TreeNodeColor) {
        self.value = value
        self.nodeColor = nodeColor
        self.leftNode = left
        self.rightNode = right
        self.parent = parent
    }


    /// - Returns: 返回祖父节点，如果没有返回nil
    public func grandParentNode() -> RedBlackTreeNode? {
        guard let grandParentNode = self.parent?.parent else {
            return nil
        }
        return grandParentNode
    }


    /// - Returns: 返回父节点同级的其他节点（“叔叔”节点）
    public func uncleNode() -> RedBlackTreeNode? {
        guard let grandParent = self.grandParentNode() else {
            return nil
        }

        if parent === grandParent.leftNode {
            return grandParent.rightNode
        }else {
            return grandParent.leftNode
        }
    }



    //MARK: 旋转
    // 左旋示例：
    //           3                                        10
    //         /   \                                    /     \
    //        1     10         -->从节点10左旋          3       15
    //             /  \                              /  \
    //            6    15                           1    6
    public func rotateLeft() {
        guard let parent = parent else {
            return
        }

        let grandParent = parent.parent
        let newLeftNodesRightNode = self.leftNode
        var wasLeftNode = false
        if parent === grandParent?.leftNode {
            wasLeftNode = true
        }

        self.leftNode = parent
        self.leftNode?.parent = self

        self.parent = grandParent
        if wasLeftNode {
            grandParent?.leftNode = self
        }else {
            grandParent?.rightNode = self
        }

        self.leftNode?.rightNode = newLeftNodesRightNode
        self.leftNode?.rightNode?.parent = self.leftNode
    }

    //右旋
    //           10                                    3
    //         /    \                                 /   \
    //        3     15         -->从节点10右旋         1    10
    //       /  \                                         /  \
    //      1    6                                       6    15
    public func rotateRight() {
        guard let parent = parent else {
            return
        }

        let grandParent = parent.parent
        let newRightNodesLeftNode = self.rightNode
        var wasLeftChild = false
        if parent === grandParent?.leftNode {
            wasLeftChild = true
        }

        self.rightNode = parent
        self.leftNode?.parent = self

        self.parent = grandParent
        if wasLeftChild {
            grandParent?.rightNode = self
        }else {
            grandParent?.rightNode = self
        }

        self.rightNode?.leftNode = newRightNodesLeftNode
        self.rightNode?.leftNode?.parent = self.rightNode
    }

}


//MARK: -  插入节点
extension RedBlackTreeNode {

    func addNode(value:T) {
        if value < self.value {

            if let leftChild = leftNode {
                leftChild.addNode(value: value)
            } else {
                let newNode = RedBlackTreeNode(value: value,nodeColor: .black)
                newNode.parent = self
                newNode.nodeColor = TreeNodeColor.red
                leftNode = newNode

                insertionStep1 (node: newNode)

            }
        } else {

            if let rightChild = rightNode {
                rightChild.addNode(value: value)
            } else {
                let newNode = RedBlackTreeNode(value: value, nodeColor: .black)
                newNode.parent = self
                newNode.nodeColor = TreeNodeColor.red
                rightNode = newNode

                insertionStep1(node: newNode)

            }
        }
    }



    //1.处理根节点：先当前添加的节点是第一个，所以作为根节点，更新颜色为黑色
    private func insertionStep1(node:RedBlackTreeNode) {
        if let _ = node.parent {
            insertionStep2(node: node)
        } else {
            node.nodeColor = .black
        }
    }

    //2.检查父节点的颜色，初始时是一个有效树，如果添加红色子节点，如果父节点是黑色，依然是有效树
    private func insertionStep2(node:RedBlackTreeNode) {
        if node.parent?.nodeColor == .black {
            return
        }

        insertionStep3(node: node)

    }

    //3.检查父节点和父节点同层节点是否为红色
    private func insertionStep3(node:RedBlackTreeNode) {
        if let uncle = node.uncleNode() {
            if uncle.nodeColor == .red {
                node.parent?.nodeColor = .black
                uncle.nodeColor = .black
                if let grandParent = node.grandParentNode() {
                    grandParent.nodeColor = .red
                    insertionStep1(node: grandParent)
                }
                return
            }
        }

        insertionStep4(node: node)

    }

    //4.有一种可能性需要处理
    //        Granfather（黑）                                   Granfather（黑）
    //         /          \                                      /           \
    //        Parent（红） Uncle（黑）   -->从Parent翻转     rightNode（红）  Uncle（黑）
    //          \                                          /
    //        rightNode（红）                          Parent（红）
    //翻转之后parent和rightNode翻转了，这时要把他们换回来
    private func insertionStep4(node:RedBlackTreeNode) {
        var node = node
        guard let grandParent = node.grandParentNode() else {
            return
        }
        if node === node.parent?.rightNode &&
            node.parent === grandParent.leftNode {
            node.parent?.rotateLeft()
            node = node.leftNode!
        } else if node === node.parent?.leftNode &&
            node.parent === grandParent.rightNode {
            node.parent?.rotateRight()
            node = node.rightNode!
        }

        insertionStep5(node: node)

    }


    //5.到这里得到下面的树，现在要把它变成有效树，颜色有问题，改正
    //        Granfather（黑）
    //         /          \
    //     Parent（红）   Uncle（黑）
    //         /
    //  rightNode（红）
    private func insertionStep5(node:RedBlackTreeNode) {
        guard let grandParent = node.grandParentNode() else {
            return
        }
        node.parent?.nodeColor = .black
        grandParent.nodeColor = .red
        if node === node.parent?.leftNode {
            grandParent.rotateRight()
        } else {
            grandParent.rotateLeft()
        }
    }
}


//MARK: -  打印树的内容（层次遍历节点值和颜色）
extension RedBlackTreeNode{

    /// 树信息
    ///
    /// - Parameter nodes: 打印nodes节点树信息
    public static func description(nodes:[RedBlackTreeNode]) {
        var children:[RedBlackTreeNode] = Array()

        for node:RedBlackTreeNode in nodes {
            print("\(node.value)" + " " + "\(node.nodeColor)")
            if let leftChild = node.leftNode {
                children.append(leftChild)
            }
            if let rightChild = node.rightNode {
                children.append(rightChild)
            }
        }

        if children.count > 0 {
            description(nodes: children)
        }
    }
}



