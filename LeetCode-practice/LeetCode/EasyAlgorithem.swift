//
//  AlgorithmCollection.swift
//  LeetCode-practice
//
//  Created by dzw on 2018/9/6.
//  Copyright © 2018年 dzw. All rights reserved.
//  入门以及简单级的题-题目均来自leetcode：https://leetcode-cn.com
//

import UIKit

class EasyAlgorithem:NSObject {
    
    private static let instance = EasyAlgorithem();
    class var shardCollection: EasyAlgorithem {
        return instance;
    }

    func testSingle() -> Void {
        print("run single")
    }
    
    //MARK:- ～Leetcode 题目以及解答～
    
    //MARK: -  两数之和:
    /*
     给定 nums = [2, 7, 11, 15], target = 9
     因为 nums[0] + nums[1] = 2 + 7 = 9
     所以返回 [0, 1]
     */
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let count = nums.count
        var tempDic = [Int:Int]();
        for i in 0..<count {
            tempDic[nums[i]] = i
        }
        for j in 0..<count {
            let factor = target - nums[j]
            if let index = tempDic[factor], j != index{
                return[j ,index]
            }
        }
        return []
    }
    
    //MARK: -  两数相加：给定两个非空链表来表示两个非负整数。位数按照逆序方式存储，它们的每个节点只存储单个数字。将两数相加返回一个新的链表。可以假设除了数字 0 之外，这两个数字都不会以零开头。
    /*
     输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
     输出：7 -> 0 -> 8
     原因：342 + 465 = 807
     */
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var x: ListNode? = l1
        var y: ListNode? = l2
        let dummy = ListNode()
        var current = dummy
        var sum = 0
        
        while x != nil || y != nil {
            // Sum
            sum /= 10
            if let _ = x {
                sum += x!.value
                x = x!.next
            }
            if let _ = y {
                sum += y!.value
                y = y!.next
            }
            
            // Move next
            current.next = ListNode(sum % 10)
            current = current.next!
        }
        
        // If the previous node is greater than 10
        if sum / 10 > 0 {
            current.next = ListNode(1)
        }
        
        return dummy.next!
    }
    
    //MARK: -   整数反转
    /*
     给定一个 32 位有符号整数，将整数中的数字进行反转。
     Int32.max值为214748367，Int32.min值为-2147483648
     */
    func reverse(_ x: Int) -> Int {
        var mx:Int = x
        var rev:Int = 0
        while (mx != 0){
            let pop:Int = mx % 10
            mx /= 10
            if (rev > Int32.max || ( rev == Int32.max && pop > 7)){
                return 0
            }
            if (rev < Int32.min || ( rev == Int32.min && pop < -8 )) {
                return 0
            }
            rev = rev * 10 + pop
        }
        return rev
    }
    
    //MARK: - 回文数：  判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
    /*
     示例 :
     输入: 121
     输出: true
     */
    func isPalindromeNumber(num: Int) -> Bool{
        if num < 0 && (num % 10 == 0 && num != 0) {
            return false
        }
        var reversed = 0, temp = num
        while temp != 0 {
            reversed = reversed * 10 + temp % 10
            temp /= 10
        }
        return num == reversed || num == reversed/10
    }
    //MARK: -  罗马数字转整数
    /*
     罗马数字包含以下七种字符: I， V， X， L，C，D 和 M。给定一个罗马数字，将其转换成整数。输入确保在 1 到 3999 的范围内。
     示例 :
     输入: "III"
     输出: 3
     */
    func romanToInt(_ s: String) -> Int {
        if s.count == 0 {return 0}
        var sum = 0
        for i in 0 ..< s.count {
            switch s[s.index(s.startIndex, offsetBy: i)] {
            case "I":
                sum += 1
            case "V":
                sum += 5
                if i > 0 && s[s.index(s.startIndex, offsetBy: i - 1)] == "I" {
                    sum -= 2
                }
            case "X":
                sum += 10
                if i > 0 && s[s.index(s.startIndex, offsetBy: i - 1)] == "I" {
                    sum -= 2
                }
            case "L":
                sum += 50
                if i > 0 && s[s.index(s.startIndex, offsetBy: i - 1)] == "X" {
                    sum -= 20
                }
            case "C":
                sum += 100
                if i > 0 && s[s.index(s.startIndex, offsetBy: i - 1)] == "X" {
                    sum -= 20
                }
            case "D":
                sum += 500
                if i > 0 && s[s.index(s.startIndex, offsetBy: i - 1)] == "C" {
                    sum -= 200
                }
            case "M":
                sum += 1000
                if i > 0 && s[s.index(s.startIndex, offsetBy: i - 1)] == "C" {
                    sum -= 200
                }
            default :
                sum += 0
            }
        }
        return sum
    }
}





