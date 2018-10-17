//
//  Queue.swift
//  LeetCode-practice
//
//  Created by dzw on 2018/10/11.
//  Copyright © 2018年 dzw. All rights reserved.
//  队列

//

import UIKit

public struct Queue<T> {
    private var data = [T]()

    //MARK: -  现有元素个数
    public var count : Int{
        get{
            return data.count
        }
    }
    
    /// 容量
    public var capacity: Int {
        get {
            return Swift.max(data.capacity, 1)
        }
        set {
            data.reserveCapacity(newValue)
        }
    }
    
    /// 构造方法
    public init() {}

    /// element入队列
    public mutating func enqueue(element: T) {
        data.append(element)
    }
    
    ///出队列 遵循先入先出
    public mutating func dequeue() -> T? {
        return data.removeFirst()
    }
    
    /// 返回队列顶部元素 也就是出队列操作的第一个被移除元素
    public func peek() -> T? {
        return data.first
    }
    
    /// 清空队列
    public mutating func removeAll() {
        data.removeAll()
    }
    
    /// 是否满
    public func isFull() -> Bool {
        return count == data.capacity
    }
    
    /// 是否空
    public func isEmpty() -> Bool {
        return data.isEmpty
    }
}

//MARK: -  打印信息
extension Queue: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        return data.description
    }
    
    public var debugDescription: String {
        return data.debugDescription
    }
}

//MARK: -  允许使用数组或者字面量构造队列
extension Queue: ExpressibleByArrayLiteral {
    
    public init<S: Sequence>(_ elements: S) where
        S.Iterator.Element == T {
            data.append(contentsOf: elements)
    }
    
    public init(arrayLiteral elements: T...) {
        self.init(elements)
    }
}

//MARK: -  允许使用forin循环迭代队列内容 时间复杂度： O(1).
extension Queue: Sequence{
    public func makeIterator() -> AnyIterator<T> {
        return AnyIterator(IndexingIterator(_elements:data.lazy.reversed()))
    }
}


