//
//  Heap.swift
//  LeetCode-practice
//
//  Created by dzw on 2018/10/15.
//  Copyright © 2018年 dzw. All rights reserved.
//  堆（优先队列）
//

import UIKit

struct Heap<T> {
    

    private var elements: [T]

    private let priorityFunction: (T, T) -> Bool
    
    var isEmpty : Bool {
        return elements.isEmpty
    }
    
    var count : Int {
        return elements.count
    }

    /// 堆 构造函数
    ///
    /// - Parameters:
    ///   - elements: 入堆元素
    ///   - priorityFunction: 确定元素优先级
    ///     内部以elements[firstIndex], elements[secondIndex]比较 使用">"表达式就是max-heap，"<"就是min-heap
    public init(elements: [T] = [], priorityFunction: @escaping (T, T) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        createHeap()
    }
    
    
    private mutating func createHeap() {
        for index in (0 ..< count / 2).reversed() {
            siftDown(index)
        }
    }
    
    ///堆顶
    public func peek() -> T? {
        return elements.first
    }
    
    func isRoot(_ index: Int) -> Bool {
        return (index == 0)
    }
    
    ///当前节点的左子节点
    func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    
    ///当前节点的右子节点
    func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }
    
    ///当前节点的父节点
    func parentIndex(of index: Int) -> Int {
        guard (index - 1)/2 >= 0  else {
            return -1
        }
        return (index - 1) / 2
    }
    
    
    /// 插入元素
    ///
    /// - Parameter element: 插入的元素 类型：T
    mutating func enqueue(_ element: T) {
        elements.append(element)
        siftUP(elementAtIndex: elements.count - 1)
    }
    
    
    /// 删除堆顶元素,max-heap的话就是最大的元素 min-heap的话就是最小的元素
    ///
    /// - Returns: 返回被移除的元素 类型：T
    mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        if elements.count == 1 {
            return elements.removeLast()
        }else{
            let rmElement = elements.first
            elements[0] = elements.removeLast()
            siftDown(0)
            return rmElement
        }
    }
}

private extension Heap {
    func isHigherPriority(firstIndex: Int, secondIndex: Int) -> Bool{
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(firstIndex: childIndex, secondIndex: parentIndex)
            else { return parentIndex }
        return childIndex
    }
    
    func highestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }
    
    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex
            else { return }
        elements.swapAt(firstIndex, secondIndex)
    }
    
    ///从新的节点开始向下判断优先级 复杂度 O(log n)
    mutating func siftDown(_ elementIndex: Int) {
        let highestIndex = highestPriorityIndex(for: elementIndex)
        if highestIndex == elementIndex { return }
        swapElement(at: elementIndex, with: highestIndex)
        siftDown(highestIndex)
    }
    
    ///从新的父节点开始向上比较优先级 复杂度 O(log n)
    mutating func siftUP(elementAtIndex: Int)  {

        let parentIndex = self.parentIndex(of: elementAtIndex)
        guard !isRoot(elementAtIndex), isHigherPriority(firstIndex: elementAtIndex, secondIndex: parentIndex) else {
            return
        }
        swapElement(at: elementAtIndex, with: parentIndex)
        siftUP(elementAtIndex: parentIndex)
    }
}

extension Heap:Sequence{
    public func makeIterator() -> AnyIterator<T> {
        return AnyIterator(IndexingIterator(_elements:
            self.elements.lazy))
    }
}

//MARK: -  打印信息
extension Heap : CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        return self.elements.description
    }
    public var debugDescription: String {
        return self.elements.debugDescription
    }
}




