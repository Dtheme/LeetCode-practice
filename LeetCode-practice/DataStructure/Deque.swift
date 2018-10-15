//
//  Deque.swift
//  LeetCode-practice
//
//  Created by dzw on 2018/10/12.
//  Copyright © 2018年 dzw. All rights reserved.
//  双端队列
//

import UIKit

public struct Deque<T> {
    
    public var capacity: Int
    private var data: [T?]
    private var head: Int
    private let internalCount: Int
    public var isEmpty: Bool {
        return count == 0
    }
    public var count: Int {
        return data.count - head
    }
    
    //MARK: -  构造函数
    public init() {
        self.capacity = 8
        internalCount = self.capacity
        data = [T?](repeating: nil, count: 8)
        head = 8
    }
    
    //MARK: -  入队列
    public mutating func enqueueTail(_ element: T) {
        data.append(element)
    }
    
    public mutating func enqueueHead(_ element: T) {
        if head == 0 {
            capacity *= 2
            let emptySpace = [T?](repeating: nil, count: capacity)
            data.insert(contentsOf: emptySpace, at: 0)
            head = capacity
        }
        
        head -= 1
        data[head] = element
    }
    
    //MARK: -  出队列
    public mutating func dequeueHead() -> T? {
        guard head < data.count, let element = data[head] else { return nil }
        
        data[head] = nil
        head += 1
        
        if capacity >= internalCount && head >= capacity*2 {
            let amountToRemove = capacity + capacity/2
            data.removeFirst(amountToRemove)
            head -= amountToRemove
            capacity /= 2
        }
        return element
    }
    
    public mutating func dequeueTail() -> T? {
        if isEmpty {
            return nil
        } else {
            return data.removeLast()
        }
    }
    
    //MARK: -  队列顶
    public func queryHead() -> T? {
        if isEmpty {
            return nil
        } else {
            return data[head]
        }
    }
    
    public func queryTail() -> T? {
        if isEmpty {
            return nil
        } else {
            return data.last!
        }
    }
}

extension Deque: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        return data.description
    }
    
    public var debugDescription: String {
        return data.debugDescription
    }
}
