//
//  SortAlgorithemTest.swift
//  LeetCode-practiceTests
//
//  Created by dzw on 2018/9/30.
//  Copyright © 2018年 dzw. All rights reserved.
//

import XCTest

@testable import LeetCode_practice

class SortAlgorithemTest: XCTestCase {
    
    let sort = SortAlgorithem.shardCollection
    var disorderArray = NSMutableArray.init(array: [231,432,12,4,521,19275,43,68532,67])
    var result : NSArray = []
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    //    MARK: - 排序算法测试
    func testBubbleSort(){
     
        self.measure {
            self.result = sort.bubbleSort(array: disorderArray)
        }
        print(self.result)
        
    }
    
    func testSelectionSort(){
        self.measure {
            self.result = sort.selectionSort(array: disorderArray) 
        }
        print(self.result)
    }
    
    func testInsertionSort(){
        self.measure {
            self.result = sort.insertionSort(array: disorderArray)
        }
        print(self.result)
    }
    
    func testShellSort() {
        self.measure {
            self.result = sort.shellSort(array: disorderArray)
        }
        print(self.result)
    }
    
    func testMergeSort() {
        self.measure {
            self.result = sort.mergeSort(array: disorderArray as! Array) as NSArray
        }
        print(self.result)
    }
    
    func testQuickSort() {
        var array : Array<Int> = disorderArray as! Array<Int>
        self.measure {
            self.result = sort.quickSort(array: &array) as NSArray
        }
        print(self.result)
    }
    
    func testBucketSort() {
        var array : Array<Int> = disorderArray as! Array<Int>
        self.measure {
            self.result = sort.bucketSort(array: &array, gap:10)
        }
        print(self.result)
    }
    
    func testHeapSort() {
        var array : Array<Int> = disorderArray as! Array<Int>
        self.measure {
            self.result = sort.HeapSort(array: &array)
        }
        print(self.result)
    }
    
    func testCountingSort() {
        var array : Array<Int> = disorderArray as! Array<Int>
        self.measure {
            self.result = sort.countingSort(array: &array)
        }
        print(self.result)
    }
    
    
}
