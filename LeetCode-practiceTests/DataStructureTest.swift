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
        let rootNode = BinaryTreeNode(value: 1)
        rootNode.addNode(value: 100)
        rootNode.addNode(value: 125)
        rootNode.addNode(value: 291)
        rootNode.addNode(value: 98)
        rootNode.addNode(value: 64)
        
        //前序遍历
        let res1 = rootNode.getInorderResult()
        print(res1)
        //翻转
        rootNode.reverse()

        //前序遍历
        let res2 = rootNode.getInorderResult()
        print(res2)


    }
    
    func testBinarySearchTree(){
        //构造一个二叉搜索树
        let rootNode = BinarySearchTreeNode(value: 10)
        rootNode.addNode(value: 20)
        rootNode.addNode(value: 5)
        rootNode.addNode(value: 21)
        rootNode.addNode(value: 8)
        rootNode.addNode(value: 4)
        
//        //前序递归遍历A
//        let resPreorder = BinarySearchTreeNode.traverse(node: rootNode, type: .PreOrder)
//        print("前序:\(resPreorder.debugDescription)")
        
        //中序递归遍历 就是
        let resInorder = BinarySearchTreeNode.traverse(node: rootNode, type: .InOrder)
        print("中序:\(resInorder.debugDescription)")

//        //后序递归遍历
//        let postPreorder = BinarySearchTreeNode.traverse(node: rootNode, type: .PostOrder)
//        print(postPreorder.debugDescription)
//        print("后序:\(postPreorder.debugDescription)")
//
//        //广度优先遍历
//        let BFTResult = BinarySearchTreeNode.traverse(node: rootNode, type: .BreadthFirst)
//        print(BFTResult.debugDescription)
//        print("广度优先:\(BFTResult.debugDescription)")
        
//        //搜索
//        let searchValue11 = rootNode.search(value: 11)?.rootNode
//        let searchValue21 = rootNode.search(value: 21)?.rootNode
//        print("搜索是否有11: " + "\(String(describing: searchValue11))")
//        print("搜索是否有21: " + "\(String(describing: searchValue21))")
//
//        //删除节点
//        /*删除前
//               10
//            /      \
//           5       20
//          / \     /  \
//         4   8  nil   21
//         */
//
//        rootNode.rightNode?.delete()
//        /*删除后
//                10
//             /      \
//            5       21
//           / \
//          4   8
//         */
//        rootNode.leftNode?.rightNode?.delete()
//        /*删除后
//               10
//            /      \
//           5       21
//          / \
//         4  nil
//         */
//        let after_del = BinarySearchTreeNode.traverse(node: rootNode, type: .InOrder)
//        print("删除后-中序遍历：\(after_del.debugDescription)")
//
//        print(rootNode.depth() as Any)
    }
    
    
    //MARK: -  测试红黑树
    func testRedBlackTree() {
        let rootNode = RedBlackTreeNode.init(value: 10, nodeColor:.black)
        rootNode.addNode(value: 12)
        rootNode.addNode(value: 5)
        rootNode.addNode(value: 3)
        rootNode.addNode(value: 8)
        rootNode.addNode(value: 30)
        rootNode.addNode(value: 11)
        rootNode.addNode(value: 32)
        rootNode.addNode(value: 4)
        rootNode.addNode(value: 2)

        RedBlackTreeNode.description(nodes: [rootNode])
        
    }
    
    //MARK: -  AVLTree
    func testAVLTree() {
        let avlRootNode = AVLTreeNode.init(value: 100)
        avlRootNode.addNode(value: 50)
        avlRootNode.addNode(value: 200)
        avlRootNode.addNode(value: 150)
        avlRootNode.addNode(value: 125)
        avlRootNode.addNode(value: 250)
        
        avlRootNode.balanceFactor = 2
        avlRootNode.rightChild?.balanceFactor = -1
        avlRootNode.rightChild?.rightChild?.balanceFactor = 0
        
        avlRootNode.rightChild?.leftChild?.balanceFactor = -1
        avlRootNode.rightChild?.leftChild?.leftChild?.balanceFactor = 0
        avlRootNode.leftChild?.balanceFactor = 0
        
        print("Invalid AVL tree")
        AVLTreeNode.printTree(nodes: [avlRootNode])
        
        //深度优先遍历
        print("深度优先遍历：Valid AVL tree")
        AVLTreeNode.printTree(nodes: [avlRootNode])
    }
    
    func testLRUCache() {
        
        //构造一个容量为5的缓存池
        let cachePool = LURCache.init(cacheSize: 5)
        
        //插入5个数据
        cachePool.put(key: "a", value: 21)
        cachePool.put(key: "b", value: 43)
        cachePool.put(key: "c", value: 64)
        cachePool.put(key: "d", value: 34)
        cachePool.put(key: "e", value: 87)
        
        //打印缓存池内容
        print(cachePool.debugDescription)
        
        //再插入一个数据
        cachePool.put(key: "f", value: 76)
        //由于满了 会从尾部数据移除一个，打印内容
        print(cachePool.debugDescription)
        
        //根据key查找值
        let value = cachePool.get(key: "e")
        print(value!)
        
    }
    
    //MARK: - graph
    func testAdjacencyMatrixGraphDescription() {
        
        let graph = AdjacencyMatrixGraph<String>()
        
        let a = graph.createVertex("a")
        let b = graph.createVertex("b")
        let c = graph.createVertex("c")
        
        graph.addDirectedEdge(a, to: b, withWeight: 1.0)
        graph.addDirectedEdge(b, to: c, withWeight: 2.0)
        
        let expectedValue = "  ø   1.0   ø  \n  ø    ø   2.0 \n  ø    ø    ø  "
        XCTAssertEqual(graph.description, expectedValue)
    }
    func testAdjacencyListGraphDescription() {
        
        let graph = AdjacencyListGraph<String>()
        
        let a = graph.createVertex("a")
        let b = graph.createVertex("b")
        let c = graph.createVertex("c")
        
        graph.addDirectedEdge(a, to: b, withWeight: 1.0)
        graph.addDirectedEdge(b, to: c, withWeight: 2.0)
        graph.addDirectedEdge(a, to: c, withWeight: -5.5)
        
        let expectedValue = "a -> [(b: 1.0), (c: -5.5)]\nb -> [(c: 2.0)]"
        XCTAssertEqual(graph.description, expectedValue)
    }
    func testEdgesFromReturnsCorrectEdgeInSingleEdgeDirecedGraphWithType(_ graphType: AbstractGraph<Int>.Type) {
        let graph = graphType.init()
        
        let a = graph.createVertex(1)
        let b = graph.createVertex(2)
        
        graph.addDirectedEdge(a, to: b, withWeight: 1.0)
        
        let edgesFromA = graph.edgesFrom(a)
        let edgesFromB = graph.edgesFrom(b)
        
        XCTAssertEqual(edgesFromA.count, 1)
        XCTAssertEqual(edgesFromB.count, 0)
        
        XCTAssertEqual(edgesFromA.first?.to, b)
    }
    func testEdgesFromReturnsCorrectEdgeInSingleEdgeUndirectedGraphWithType(_ graphType: AbstractGraph<Int>.Type) {
        let graph = graphType.init()
        
        let a = graph.createVertex(1)
        let b = graph.createVertex(2)
        
        graph.addUndirectedEdge((a, b), withWeight: 1.0)
        
        let edgesFromA = graph.edgesFrom(a)
        let edgesFromB = graph.edgesFrom(b)
        
        XCTAssertEqual(edgesFromA.count, 1)
        XCTAssertEqual(edgesFromB.count, 1)
        
        XCTAssertEqual(edgesFromA.first?.to, b)
        XCTAssertEqual(edgesFromB.first?.to, a)
    }
    
    func testEdgesFromReturnsNoEdgesInNoEdgeGraphWithType(_ graphType: AbstractGraph<Int>.Type) {
        let graph = graphType.init()
        
        let a = graph.createVertex(1)
        let b = graph.createVertex(2)
        
        XCTAssertEqual(graph.edgesFrom(a).count, 0)
        XCTAssertEqual(graph.edgesFrom(b).count, 0)
    }
    
    func testEdgesFromReturnsCorrectEdgesInBiggerGraphInDirectedGraphWithType(_ graphType: AbstractGraph<Int>.Type) {
        let graph = graphType.init()
        let verticesCount = 100
        var vertices: [Vertex<Int>] = []
        
        for i in 0..<verticesCount {
            vertices.append(graph.createVertex(i))
        }
        
        for i in 0..<verticesCount {
            for j in i+1..<verticesCount {
                graph.addDirectedEdge(vertices[i], to: vertices[j], withWeight: 1)
            }
        }
        
        for i in 0..<verticesCount {
            let outEdges = graph.edgesFrom(vertices[i])
            let toVertices = outEdges.map {return $0.to}
            XCTAssertEqual(outEdges.count, verticesCount - i - 1)
            for j in i+1..<verticesCount {
                XCTAssertTrue(toVertices.contains(vertices[j]))
            }
        }
    }
    func testEdgesFromReturnsCorrectEdgeInSingleEdgeDirecedMatrixGraph() {
        testEdgesFromReturnsCorrectEdgeInSingleEdgeDirecedGraphWithType(AdjacencyMatrixGraph<Int>.self)
    }
    
    func testEdgesFromReturnsCorrectEdgeInSingleEdgeUndirectedMatrixGraph() {
        testEdgesFromReturnsCorrectEdgeInSingleEdgeUndirectedGraphWithType(AdjacencyMatrixGraph<Int>.self)
    }

    func testEdgesFromReturnsNoInNoEdgeMatrixGraph() {
        testEdgesFromReturnsNoEdgesInNoEdgeGraphWithType(AdjacencyMatrixGraph<Int>.self)
    }
    
    func testEdgesFromReturnsCorrectEdgesInBiggerGraphInDirectedMatrixGraph() {
        testEdgesFromReturnsCorrectEdgesInBiggerGraphInDirectedGraphWithType(AdjacencyMatrixGraph<Int>.self)
    }
    
    func testEdgesFromReturnsCorrectEdgeInSingleEdgeDirecedListGraph() {
        testEdgesFromReturnsCorrectEdgeInSingleEdgeDirecedGraphWithType(AdjacencyListGraph<Int>.self)
    }
    
    func testEdgesFromReturnsCorrectEdgeInSingleEdgeUndirectedListGraph() {
        testEdgesFromReturnsCorrectEdgeInSingleEdgeUndirectedGraphWithType(AdjacencyListGraph<Int>.self)
    }
    
    func testEdgesFromReturnsNoInNoEdgeListGraph() {
        testEdgesFromReturnsNoEdgesInNoEdgeGraphWithType(AdjacencyListGraph<Int>.self)
    }
    
    func testEdgesFromReturnsCorrectEdgesInBiggerGraphInDirectedListGraph() {
        testEdgesFromReturnsCorrectEdgesInBiggerGraphInDirectedGraphWithType(AdjacencyListGraph<Int>.self)
    }
}
