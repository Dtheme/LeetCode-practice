//
//  CircularbufferQueue.swift
//  LeetCode-practice
//
//  Created by dzw on 2018/10/11.
//  Copyright © 2018年 dzw. All rights reserved.
//  环形缓冲区（队列）
//  

import UIKit

public enum CircularBufferOperation {
    case Ignore, Overwrite
}

public struct CircularbufferQueue<T> {
    fileprivate var data: [T]
    fileprivate var head: Int = 0, tail: Int = 0
    private var internalCount: Int = 0
    
    
    private var overwriteOperation:
        CircularBufferOperation = CircularBufferOperation.Overwrite
    
    ///缓冲区中的元素个数
    public var count: Int {
        return internalCount
    }
    
    ///缓冲区的容量
    public var capacity: Int {
        get {
            return data.capacity
        }
        
        set {
            data.reserveCapacity(newValue)
        }
    }
    
    /// 构造一个默认容量是16的缓冲区
    public init() {
        data = [T]()
        data.reserveCapacity(16)
    }
    
    /// 通过count构造环形缓冲区，为了确保容量是2的次方数字 如果count不是2的次方，会给一个大于它的最小的2的次方数
    public init(_ count:Int, overwriteOperation:CircularBufferOperation = .Overwrite){
        var capacity = count
        if (capacity < 1) {
            capacity = 16
        }
        
        if ((capacity & (~capacity + 1)) != capacity) {
            var b = 1
            while (b < capacity) {
                b = b << 1
            }
            capacity = b
        }
        
        
        data = [T]()
        data.reserveCapacity(capacity)
        self.overwriteOperation = overwriteOperation
    }
    
    //MARK: -  支持通过字面量或者数组构造环形缓冲区
    public init<S: Sequence>(_ elements: S, size: Int)
        where S.Iterator.Element == T {
            self.init(size)
            elements.forEach({ push(element: $0) })
    }
    
    public init(arrayLiteral elements: T...) {
        self.init(elements, size: elements.count)
    }
    
    
    /// 从头结点pop一个元素出去 head指针+1
    /// - Returns: pop出来的元素
    public mutating func pop() -> T? {
        if (isEmpty()){
            return nil
        }
        let el = data[head]
        //pop出去以后用空字符串占位 暂时不知道这么做合不合适 mark一下 ？？？
        data[head] = "" as! T
        head = incrementPointer(pointer: head)
        internalCount -= 1
        
        return el
    }
    
    /// 查询缓存区顶部的元素
    /// - Returns: 返回查询到的元素
    public func peek() -> T? {
        if (isEmpty()){
            return nil
        }
        return data[head]
    }
    
    /// 从尾结点添加一个元素
    /// - Parameter element: 添加的元素 <T>
    public mutating func push(element: T) {
        if (isFull()){
            switch(overwriteOperation){
            case .Ignore:
                // Do not add new elements until the count is less than the capacity
                return
            case .Overwrite:
                _ = pop()
            }
        }
        
        if (data.endIndex < data.capacity) {
            data.append(element)
        }
        else {
            data[tail] = element
        }
        
        tail = incrementPointer(pointer: tail)
        internalCount += 1
    }
    
    
    /// 清空环形缓存区
    public mutating func clear() {
        head = 0
        tail = 0
        internalCount = 0
        data.removeAll(keepingCapacity: true)
    }
   
    public func isFull() -> Bool {
        return count == data.capacity
    }
    
    public func isEmpty() -> Bool {
        return (count < 1)
    }
    
    //MARK: -  private
    fileprivate func incrementPointer(pointer: Int) -> Int
    {
        return (pointer + 1) & (data.capacity - 1)
    }
    
    fileprivate func decrementPointer(pointer: Int) -> Int
    {
        return (pointer - 1) & (data.capacity - 1)
    }
    
    fileprivate func
        convertLogicalToRealIndex(logicalIndex: Int) -> Int {
        return (head + logicalIndex) & (data.capacity - 1)
    }
    
    fileprivate func checkIndex(index: Int) {
        if index < 0 || index > count {
            fatalError("Index out of range")
        }
    }
}

//MARK: -  打印信息
extension CircularbufferQueue: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        return data.description
    }
    
    public var debugDescription: String {
        return data.debugDescription
    }
}


