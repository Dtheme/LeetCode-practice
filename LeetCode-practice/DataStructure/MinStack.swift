//
//  MinStack.swift
//  LeetCode-practice
//
//  Created by dzw on 2018/10/15.
//  Copyright © 2018年 dzw. All rights reserved.
//
//  最小值栈
//

import Foundation

class MinStack {
    
    var stack = Stack<Int>()
    private var minStack:[Int] = []
    
    func push(element:Int) {

        stack.push(element: element)
        let minValue:Int? = getMin()
        if minValue == nil  || element <= minValue! { // 与最小值相等的时候说明有重复数据
            minStack.append(element)
        }
    }
    
    func pop() {
        
        if stack.count == 0 {
            return
        }
        
        let value:Int = stack.peek()!
        _ = stack.pop()
        
        if value == getMin() {
            minStack.removeLast()
        }
    }
    
    func getMin() -> Int? {
        if minStack.count == 0 {
            return nil
        }
        return minStack.last!
    }
    
    func peek() -> Int? {
        if self.stack.count == 0 {
            return nil
        }
        return self.stack.peek()!
    }
}


//MARK: -  打印栈信息
extension MinStack: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        return self.stack.description
    }
    
    public var debugDescription: String {
        return self.stack.debugDescription
    }
    
}
