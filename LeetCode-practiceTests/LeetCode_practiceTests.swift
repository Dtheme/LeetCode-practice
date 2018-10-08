//
//  LeetCode_practiceTests.swift
//  LeetCode-practiceTests
//
//  Created by dzw on 2018/9/6.
//  Copyright © 2018年 dzw. All rights reserved.
//

import XCTest

@testable import LeetCode_practice


class LeetCode_practiceTests: XCTestCase {
    
    let leetCode = EasyAlgorithem.shardCollection
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //MARK: - 两数之和
    func testTwoSum() {
        let result = leetCode.twoSum([2, 7, 11, 15], 9)
        print([Int](result))
        
    }
    
}
