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
    
    func testDeque() {
        //创建一个Deque
        var deque = Deque<Int>()
        deque.enqueueHead(1)
        deque.enqueueTail(99)
        deque.enqueueHead(2)
        deque.enqueueTail(100)
        print("队列内容：\(deque.debugDescription)")
        
        //出队列
        let headEle = deque.dequeueHead()!
        let tailEle = deque.dequeueTail()!
        print("头元素：\(String(headEle)),尾元素：\(String(tailEle)),队列内容：\(deque.debugDescription))" )
    }
    
    //MARK: -  测试最小值栈
    func testMinStack() {
        let minS =  MinStack()
        minS.push(element: 100)
        minS.push(element: 200)
        minS.push(element: 1)
        minS.push(element: 2189)
        let result = minS.getMin()!
        print("打印栈内容：\(minS.debugDescription),最小值：\(String(result)),栈顶：\(minS.peek()!)")
    }
    
    //MARK: -  测试堆
    func testHeap() {

//        let ele = [2,3,4,5,6,7,8]
        let ele = [12,35,7,15,2,3,8]

        var maxheap = Heap<Int>(elements: ele) { (first, second) -> Bool in
            return first > second
        }
        
        let minHeap = Heap<Int>(elements: ele) { (first, second) -> Bool in
            return first < second
        }

        let maxPeek = maxheap.peek()!
        let minPeek = minHeap.peek()!
        
        print(maxheap.debugDescription)
        print("大堆堆顶:\(maxPeek),小堆堆顶:\(minPeek)")
        

        let deq = maxheap.dequeue()
        let _ = maxheap.dequeue()
        
        print(deq!)
        print("大堆信息：\(maxheap.description)")
    }
    
    //MARK: -  测试一般二叉树
    func testBinaryTree() {

        //创建一般二叉树
        let arr = [1,2,3,4,5,6,7]
        var bTree = BinaryTree().createBinaryTree(array: arr)
        bTree?.AddTreeNode(node: &bTree, 100)
        bTree?.AddTreeNode(node: &bTree, 200)
        
        //前序遍历
        let res1 = bTree?.getInorderResult()
        print(res1!)
        //翻转
        bTree?.reverse()

        //前序遍历
        let res2 = bTree?.getInorderResult()
        print(res2!)

        
    }
    
    func testBinarySearchTree(){
        //构造一个二叉搜索树
        let rootNode = BinarySearchTree(value: 10)
        rootNode.addNode(value: 20)
        rootNode.addNode(value: 5)
        rootNode.addNode(value: 21)
        rootNode.addNode(value: 8)
        rootNode.addNode(value: 4)
    
        
        //前序递归遍历
        let resPreorder = BinarySearchTree.traverse(node: rootNode, type: .PreOrder)
        print("前序:\(resPreorder.debugDescription)")
        
        //中序递归遍历
        let resInorder = BinarySearchTree.traverse(node: rootNode, type: .InOrder)
        print("中序:\(resInorder.debugDescription)")

        //后序递归遍历
        let postPreorder = BinarySearchTree.traverse(node: rootNode, type: .PostOrder)
        print(postPreorder.debugDescription)
        print("后序:\(postPreorder.debugDescription)")
        
        //广度优先遍历
        let BFTResult = BinarySearchTree.traverse(node: rootNode, type: .BreadthFirst)
        print(BFTResult.debugDescription)
        print("广度优先:\(BFTResult.debugDescription)")
        
        //搜索
        let searchValue11 = rootNode.search(value: 11)?.value
        let searchValue21 = rootNode.search(value: 21)?.value
        print("搜索是否有11: " + "\(String(describing: searchValue11))")
        print("搜索是否有21: " + "\(String(describing: searchValue21))")
        
        //删除节点
        /*删除前
               10
            /      \
           5       20
          / \     /  \
         4   8  nil   21
         */
        
        rootNode.rightNode?.delete()
        /*删除后
                10
             /      \
            5       21
           / \
          4   8
         */
        rootNode.leftNode?.rightNode?.delete()
        /*删除后
               10
            /      \
           5       21
          / \
         4  nil
         */
        let after_del = BinarySearchTree.traverse(node: rootNode, type: .InOrder)
        print("删除后-中序遍历：\(after_del.debugDescription)")
        
        print(rootNode.depth() as Any)
    }
}
