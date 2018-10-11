//
//  StackTest.swift
//  LeetCode-practiceTests
//
//  Created by dzw on 2018/10/10.
//  Copyright © 2018年 dzw. All rights reserved.
//

import XCTest
@testable import LeetCode_practice

class DataStructureTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //MARK: -  测试栈
    func testStack() {
        //创建栈
        var astack = Stack<Character>()
        //数据入栈
        astack.push(element: "A")
        astack.push(element: "B")
        astack.push(element: "C")
        
        print("打印栈内容：\(astack.description)")
        
        //支持for in
        for ele in astack{
            print("for-in support test：\(ele)")
        }
        
        let peak = astack.peek()!
        let lastP = astack.pop()!
        let count = astack.count
        print("栈顶：\(peak),最后一次pop的内容：\(String(describing: lastP)),栈中剩余：\(count)")
        
        //使用数组创建栈，将数组中的元素依次压入栈
        let temp = ["test1","test2","test3","test4"]
        let bstack = Stack<Any>(temp)
        print(bstack.description)
    }
    
    //MARK: -  测试链表
    func testLinklist() {
        //手动创建3个节点
        let node1 = ListNode()
        let node2 = ListNode()
        let node3 = ListNode()
        
        node1.value = "test1"
        node1.next = node2
        
        node2.value = "test2"
        node2.next = node3
        
        node3.value = "test3"
        node3.next = nil
        //初始化一个链表
        let ll = LinkedList()
        ll.head = node1
        ll.tail = node3
        //在尾节点再加一个
        ll.appendToTail(value: ListNode("testAdd2Tail",nil))
        
        //访问第1个节点
        let nodeAt1 = ll.nodeAt(index: 1)!
        print("链表内容：\(ll.debugDescription),按下标查找第1节点：\(nodeAt1.value),链表大小：\(ll.count)")
        ll.removeAll()
        print(ll.debugDescription)
    }
    
    //MARK: -  测试队列
    func testQueue() {
        //创建队列
        var queue = Queue<Any>.init()
        
        //入队列
        queue.enqueue(element: "testStr1")
        queue.enqueue(element: "testStr2")
        queue.enqueue(element: "testStr3")
        queue.enqueue(element: 100)
        queue.enqueue(element: NSNumber(value: true))
        
        //for in支持
        for ele in queue{
           print("for-in support test：\(ele)")
        }
        
        let cap = queue.capacity
        let count = queue.count
        let peek = queue.peek()!
        
        print("打印队列内容：\(queue.debugDescription),队列容量：\(cap),元素个数:\(count),队列顶：\(peek)")
        
        let value = queue.dequeue()!
        print("出队列的值：\(value)")
        print("打印队列内容：\(queue.debugDescription),队列容量：\(cap),元素个数:\(count),队列顶：\(peek)")
    }
    //MARK: -  测试环形缓冲区
    func testCircularbufferQueue() {
        //构造一个环形缓存区
        var queue =  CircularbufferQueue<String>(4)
        queue.push(element: "test1")
        queue.push(element: "test2")
        queue.push(element: "test3")
        queue.push(element: "test4")
        print("环形缓冲区内容：\(queue.debugDescription)")
        
        //推出一个元素
        let popObj = queue.pop()!
        let peek = queue.peek()!
        
        print("推出的元素：\(popObj),顶部元素：\(peek),缓冲区内的数据个数：\(queue.count)")
        _ = queue.pop()
        print(queue.debugDescription)
    }
}
