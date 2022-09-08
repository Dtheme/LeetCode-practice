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
    //MARK: -  二进制求和 （超大数字暂未通过测试，可能是实现方式不对？）
    func testAddBinary() {
        let a = "10100000100100110110010000010101111011011001101110111111111101000000101111001110001111100001101"
        let b = "110101001011101110001111100110001010100001101011101010000011011011001011101111001100000011011110011"
        let result = leetcode_ez.addBinary(a, b)
        print(result)
    }
    
    //MARK: -  加一
    func testPlusOne() {
        /// 输入: [1,2,3]
        /// 输出: [1,2,4]
        let digits = [1,2,3]
        let result = leetcode_ez.plusOne(digits)
        print(result)
        
    }
    
    //MARK: -  盛最多水的容器
    func testMaxArea() {
        var result = 0;
        self.measure {
            result = leetcode_ez.maxArea([10,2,39,27,11,9,12,1,28])
        }
        print(result)
    }
    
    //MARK: -  翻转数组
    func testRotateArray() {
        var result : NSArray = []
        self.measure {
            var arr = [21,6,29,12,36,85]
            var k = 3
            result = leetcode_ez.rotateArray(array: &arr, k: &k)
        }
         print(result)
    }
    
    //MARK: -  二叉树的层平均值
    func testAverageOfLevels() {
        /*示例：已知下面的二叉树
              3
             / \
            9  20
               /  \
              15   7
         输出：分别是第0层，第1层，第2层的平均值 [3, 14.5, 11]
         */ 
        let node9 = BinarySearchTreeNode(value: 9)
        let node20 = BinarySearchTreeNode(value: 20)
        let node15 = BinarySearchTreeNode(value: 15)
        let node7 = BinarySearchTreeNode(value: 7)
        let rootNode = BinarySearchTreeNode(value: 3, left: node9, right: node20, parent: nil)
        node20.leftNode = node15
        node20.rightNode = node7
        
        var result:[Double] = []
        
        self.measure {
            result = leetcode_ez.averageOfLevels(rootNode)
        }
        print(result)
    }

    //MARK: -  移动0
    func testMoveZero() {
        var arr = [0,1,0,3,12]
        var result:[Int] = [];
        self.measure {
            result = leetcode_ez.moveZeroes(&arr)
        }
        print(result)
    }
    
    //MARK: -  买卖股票的最佳时期
    func testMaxProfit() {

        var arr = [7,1,5,3,6,4]
        var result = 0
        self.measure {
            result = leetcode_ez.maxProfit(prices: &arr)
        }
        print(result)
    }
    
    func testMaxProfitII() {
        var result = 0
        let arr = [7,1,5,3,6,4]
        self.measure {
            result = leetcode_ez.maxProfitII(arr)
        }
        print(result)
    }

    func testMaxProfitIII() {
        var result = 0
        var arr = [3,3,5,0,0,3,1,4]
        self.measure {
            result = leetcode_ez.maxProfitIII(prices: &arr)
        }
        print(result)
    }

    func testSingleNumber() {
        var result = 0
        let arr = [4,1,2,1,2,9,9]
        
        self.measure {
            result = leetcode_ez.singleNumber(arr)
        }

        print(result)
    }
    
    func testSingleNumberII() {
        var result = 0
        let arr = [2,2,3,2,98,98,98,12,12,12]
        
        self.measure {
            result = leetcode_ez.singleNumberII(arr)
        }
        
        print(result)
    }
    
    func testSingleNumberIII() {
        var result :[Int] = []
        let arr = [1,2,1,3,2,5]
        
        self.measure {
            result = leetcode_ez.singleNumberIII(arr)
        }
        
        print(result)
    }
    
    //MARK: -  打家劫舍
    func testRobI() {
        var result = 0
        let arr = [1,2,3,1]
        self.measure {
            result = leetcode_ez.rob(arr)
        }
        print("result:\(result)")
    }
    
    func testRobII() {
        var result = 0
        let arr = [2,3,2]
        self.measure {
            result = leetcode_ez.robII(arr)
        }
        print("result:\(result)")
    }
    
//    func testRobIII(){
//
//
//        // 构造一个二叉树
//        //       3
//        //      / \
//        //     2   3
//        //      \   \
//        //       1   3
//        let rootNode = BinaryTreeNode(value: 3)
//        rootNode.addNode(value: 2)
//        rootNode.addNode(value: 3)
//        rootNode.addNode(value: 3)
//        rootNode.addNode(value: 1)
//        var result = 0
//
//        print(rootNode.getInorderResult())
//        self.measure {
//            result = leetcode_ez.robIII(rootNode)
//        }
//        print(result)
//    }
 
    //MARK: -  复原IP地址
    func testRestoreIpAddresses() {
        var result : [String] = []
        self.measure  {
            result = leetcode_ez.restoreIpAddresses("25525511135");
        }
        print(result);
    }
    
    //MARK: -  网络延迟时间
    func testNetworkDelayTime() {
        var result = 0
        self.measure {
            var times : [[Int]] = [[2,1,1],[2,3,1],[3,4,1]]
            var N = 4
            var K = 2
            result = leetcode_ez.networkDelayTime(times: &times, N: &N, K: &K)
        }
        print(result)
    }
    
    //MARK: -  字符串中的第一个唯一字符
    func testFirstUniqChar() {
        var result = 0
        self.measure {
            result = leetcode_ez.firstUniqChar("loveleetcode")
        }
        print(result)
        
    }
    
    //MARK: -  最接近的三数之和
    func testThreeSumClosest() {
        var result = 0
        self.measure {
            result = leetcode_ez.threeSumClosest([-1, 2, 1, -4], 1)
        }
        print(result)
    }
   
    //MARK: -  三数之和
    func testThreeSum() {
        var result:[[Int]]?
        self.measure {
            let arr : [Int] = [-1, 0, 1, 2, -1, -4]
            result = leetcode_ez.threeSum(arr)
        }
        print(result!)
    }

    //MARK: -  电话号码的字母组合
    func testLetterCombinations() {
        var result : [String]?
        self.measure {
            result = leetcode_ez.letterCombinations("23")
        }
        print(result!)
    }
    
    //MARK: -  4sum
    func testFourSum() {
        var result : [[Int]]?
        self.measure {
            result = leetcode_ez.fourSum([1, 0, -1, 0, -2, 2], 0)
        }
        print(result!)
    }
    
    //MARK: -  找到k个最接近的元素
    func testFindClosestElements() {
        var result : NSMutableArray?
        self.measure {
            result = leetcode_ez.findClosestElements(arr: [1,2,3,4,5], k: 4, x: -1)
        }
        print(result!)
    }
}

