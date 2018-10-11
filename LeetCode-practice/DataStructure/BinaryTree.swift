//
//  BinaryTree.swift
//  LeetCode-practice
//
//  Created by dzw on 2018/9/30.
//  Copyright © 2018年 dzw. All rights reserved.
//  二叉树（未完成）
//

import UIKit

class BinaryTree: NSObject {
    var value = 0
    var leftTree : BinaryTree?
    var rightTree : BinaryTree?
    
    class func binaryTree(list:Array<Any>) -> BinaryTree? {
        if list.count == 0 {
            return nil
        }
        
        let treeModel = BinaryTree()
        for i in list {
            let value: Int = Int(truncating: i as! NSNumber)
            createBinaryTree(value: value, treeModel: treeModel)
        }
        return treeModel
    }
    
    class func createBinaryTree(value:Int , treeModel:BinaryTree) {
        
        if treeModel.value <= 0 {
            treeModel.value = value
            return
        }
        
        let midValue = treeModel.value
        if value < midValue {
            if (treeModel.leftTree == nil){
                treeModel.leftTree = BinaryTree()
                treeModel.leftTree?.value = value
                return
            }else{
                createBinaryTree(value: value, treeModel: treeModel.leftTree!)
            }
        }else{
            if (treeModel.rightTree == nil){
                treeModel.rightTree = BinaryTree()
                treeModel.rightTree?.value = value
                return
            }else{
                createBinaryTree(value: value, treeModel: treeModel.rightTree!)
            }
        }
    }
    
}
