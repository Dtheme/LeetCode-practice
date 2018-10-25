//
//  Stack.swift
//  LeetCode-practice
//
//  Created by dzw on 2018/10/10.
//  Copyright © 2018年 dzw. All rights reserved.
//  栈
//

import Foundation

public struct Stack<T> {
    private var elements = [T]()
    public init() {}
    
    public var count: Int {
        get{
            return self.elements.count
        }
    }
    
    /// 出栈
    /// - Parameter element: 值：T
    public mutating func pop() -> T? {
        return self.elements.popLast()
    }
    
    
    /// 入栈
    /// - Parameter element: 值：T
    public mutating func push(element: T){
        self.elements.append(element)
    }
    
    
    public  mutating func peek() -> T? {
        return self.elements.last
    }
    
    
    public mutating func isEmpty()-> Bool {
        return self.elements.isEmpty
    }    
}

//MARK: -  打印栈信息
extension Stack: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        return self.elements.description
    }
    
    public var debugDescription: String {
        return self.elements.debugDescription
    }
    
}


//MARK: -  可以使用一个数组或者字面量来构造栈
public struct ArrayIterator<T> : IteratorProtocol {
    var currentElement: [T]
    
    init(elements: [T]){
        self.currentElement = elements
    }
    
    mutating public func next() -> T? {
        if (!self.currentElement.isEmpty) {
            return self.currentElement.popLast()
        }
        return nil
    }
}

extension Stack: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        return AnyIterator(IndexingIterator(_elements:
            self.elements.lazy.reversed()))
    }
}


extension Stack {
    public init<S: Sequence>(_ stack: S) where S.Iterator.Element == T {
        self.elements = Array(stack.reversed())
    }
}

