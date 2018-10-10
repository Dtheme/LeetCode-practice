//
//  EasyAlgorithemTest.swift
//  LeetCode-practiceTests
//
//  Created by dzw on 2018/10/9.
//  Copyright © 2018年 dzw. All rights reserved.
//  入门以及简单级难度题目测试
//
import XCTest

@testable import LeetCode_practice

class EasyAlgorithemTest: XCTestCase {
    let leetcode_ez = EasyAlgorithem.shardCollection
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //MARK: - 两数之和
    func testTwoSum() {
        let result = leetcode_ez.twoSum([2, 7, 11, 15], 9)
        print(([Int](result)))
    }
    
    //MARK: -  两数相加
    func testAddTwoNumbers() {
        let result = leetcode_ez.addTwoNumbers(ListNode(2, ListNode(4, ListNode(3))), ListNode(5, ListNode(6, ListNode(4))))
        print(result.debugDescription)
    }
    //MARK: -  32位有符号整数翻转
    func testReverse() {
        let num = leetcode_ez.reverse(1534236469)
        print("\(num)")
    }
    //MARK: -  回文数
    func testIsPalindromeNumber() {
        let result = leetcode_ez.isPalindromeNumber(num: 876050678)
        print(result)
    }
    //MARK: -  罗马数字转整数
    func testRomanToInt() {
        let result = leetcode_ez.romanToInt("III")
        print(result)
    }
    
    //MARK: -  报数问题
    func testCountToWin() {
        let result = leetcode_ez.count2Win(queueLength: 100)
        print(result)
        
    }
    
    //MARK: -  公共前缀
    func testLongestCommonPrefix(){
        let str = ["aflower","aflow","aflight"]
        let result = leetcode_ez.longestCommonPrefix(str)
        print(result)
    }
    
    //MARK: -  有效括号
    func testValidParentheses() {
        let str = "{[]}"
        let result = leetcode_ez.validParentheses(str: str)
        print(result as Bool)
    }
}

