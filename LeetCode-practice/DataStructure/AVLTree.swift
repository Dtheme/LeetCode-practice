//
//  AVLTree.swift
//  LeetCode-practice
//
//  Created by dzw on 2018/10/24.
//  Copyright © 2018 dzw. All rights reserved.
//
//  平衡搜索树：
//  0.它能保持二叉树的高度平衡，尽量降低二叉树的高度，减少树的平均搜索长度。
//  1.左子树和右子树的高度之差的绝对值不超过1
//  2.树中的每一个左子树和右子树都是AVL树
//  3.每个节点都有一个平衡因子，任一节点的平衡因子是-1或0或1.（每个节点的平衡因子等于右子树的高度减去左子树的高度，即：bf = rightHeigh - leftHeight）

import Foundation

public class AVLTreeNode<T:Comparable> {
    
    public var value:T
    public var leftChild:AVLTreeNode?
    public var rightChild:AVLTreeNode?
    public weak var parent:AVLTreeNode?
    public var balanceFactor:Int = 0
    
    
    
    /// 遍历构造方法
    /// - Parameter value: 节点值 类型：T
    public convenience init(value: T) {
        self.init(value: value, left: nil, right: nil, parent:nil)
    }
    
    public init(value:T, left:AVLTreeNode?, right:AVLTreeNode?,
                parent:AVLTreeNode?) {
        self.value = value
        self.leftChild = left
        self.rightChild = right
        self.parent = parent
        self.balanceFactor = 0
    }
    
}

//MARK: -  旋转节点
extension AVLTreeNode {
    
    
    /// 右旋
    /// 示例：X节点右旋
    ///           y(-2)                                  x(+1)
    ///          /    \                                 /     \
    ///         x(0)   c                               a       y(-1)
    ///       /   \                                   / \     / \
    ///      a      b                ->右旋          nil  d   b   c
    ///     / \     / \                                     /  \
    ///  nil   d   nil e                                  nil   e
    /// - Returns: 返回右旋之后的树 AVLTreeNode
    public func rotateRight()  -> AVLTreeNode {
        guard let parent = parent else {
            return self
        }
        // Step 1: Rotation
        // 0.Let's store some temporary references to use them later
        let grandParent = parent.parent
        let newRightChildsLeftChild = self.rightChild
        var wasLeftChild = false
        if parent === grandParent?.leftChild {
            wasLeftChild = true
        }
        
        
        //1. My new right child is my old parent
        self.rightChild = parent
        self.rightChild?.parent = self
        
        
        //2. My new parent is my old grandparent
        self.parent = grandParent
        if wasLeftChild {
            grandParent?.leftChild = self
        }else {
            grandParent?.rightChild = self
        }
        
        
        //3. The left child of my new right child is my old right child
        self.rightChild?.leftChild = newRightChildsLeftChild
        self.rightChild?.leftChild?.parent = self.rightChild
        
        
        // Step 2: Height update
        if self.balanceFactor == 0 {
            self.balanceFactor = 1
            self.leftChild?.balanceFactor = -1
        } else {
            self.balanceFactor = 0
            self.leftChild?.balanceFactor = 0
        }
        
        return self
    }
    
    
    /// 左旋
    /// 示例：X节点左旋
    ///            x(+2)                                 y(-1)
    ///          /    \                                 /     \
    ///         a      y (0)                           x(+1)   c
    ///              /   \                            / \     / \
    ///             b      c      ->左旋              a   b   e   nil
    ///            / \    /  \                          /  \
    ///         nil   d  nil  e                        d   nil
    /// - Returns: 返回左旋之后的树 AVLTreeNode
    public func rotateLeft()  -> AVLTreeNode {
        guard let parent = parent else {
            return self
        }
        
        
        // Step 1: Rotation
        // 0.Let's store some temporary references to use them later
        let grandParent = parent.parent
        let newLeftChildsRightChild = self.leftChild
        var wasLeftChild = false
        if parent === grandParent?.leftChild {
            wasLeftChild = true
        }
        
        
        //1. My new left child is my old parent
        self.leftChild = parent
        self.leftChild?.parent = self
        
        
        //2. My new parent is my old grandparent
        self.parent = grandParent
        if wasLeftChild {
            grandParent?.leftChild = self
        } else {
            grandParent?.rightChild = self
        }
        
        
        //3. The right child of my new left child is my old left child
        self.leftChild?.rightChild = newLeftChildsRightChild
        self.leftChild?.rightChild?.parent = self.leftChild
        
        
        // Step 2: Height update
        if self.balanceFactor == 0 {
            self.balanceFactor = -1
            self.leftChild?.balanceFactor = 1
        } else {
            self.balanceFactor = 0
            self.leftChild?.balanceFactor = 0
        }
        
        return self
    }
   
}



//MARK: -  插入元素
extension AVLTreeNode{

    public func addNode(value:T) {
        if value < self.value {
            // Value is less than root value: We should insert it in
            // the left subtree.
            // Insert it into the left subtree if it exists, if not,
            // create a new node and put it as the left child.
            if let leftChild = leftChild {
                leftChild.addNode(value: value)
            } else {
                let newNode = AVLTreeNode(value: value)
                newNode.parent = self
                leftChild = newNode
            }
        } else {
            // Value is greater than root value: We should insert it in
            // the right subtree
            // Insert it into the right subtree if it exists, if not,
            // create a new node and put it as the right child.
            if let rightChild = rightChild {
                rightChild.addNode(value: value)
            } else {
                let newNode = AVLTreeNode(value: value)
                newNode.parent = self
                rightChild = newNode
            }
        }
    }
    
    // Prints each layer of the tree from top to bottom with the node
    // value and the balance factor
    public static func printTree(nodes:[AVLTreeNode]) {
        var children:[AVLTreeNode] = Array()
        
        
        for node:AVLTreeNode in nodes {
            print("\(node.value)" + " " + "\(node.balanceFactor)")
            if let leftChild = node.leftChild {
                children.append(leftChild)
            }
            if let rightChild = node.rightChild {
                children.append(rightChild)
            }
        }
        
        
        if children.count > 0 {
            printTree(nodes: children)
        }
    }
            
}

//MARK: -  打印信息
extension AVLTreeNode: CustomStringConvertible {
    
    public var debugDescription: String {
        var s = "value: \(value)"
        if let parent = parent {
            s += ", parent: \(parent.value)"
        }
        if let left = leftChild {
            s += ", left = [" + left.debugDescription + "]"
        }
        if let right = rightChild {
            s += ", right = [" + right.debugDescription + "]"
        }
        return s
    }
    
    public var description: String {
        var s = ""
        if let left = leftChild {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = rightChild {
            s += " -> (\(right.description))"
        }
        return s
    }
}


