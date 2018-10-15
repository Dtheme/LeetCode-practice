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
    /// 示例：给定 nums = [2, 7, 11, 15], target = 9
    ///      因为 nums[0] + nums[1] = 2 + 7 = 9
    ///      所以返回 [0, 1]
    /// - Parameters:
    ///   - nums: 数组
    ///   - target: 目标数
    /// - Returns:  目标数的下标的元祖
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
    
    //MARK: -  两数相加：
    /// 给定两个非空链表来表示两个非负整数。位数按照逆序方式存储，它们的每个节点只存储单个数字。将两数相加返回一个新的链表。可以假设除了数字 0 之外，这两个数字都不会以零开头。
    /// 示例： 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
    ///       输出：7 -> 0 -> 8
    ///       原因：342 + 465 = 807
    /// - Parameters:
    ///   - l1: 非空链表
    ///   - l2: 非空链表
    /// - Returns: 生成的链表
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var x: ListNode? = l1
        var y: ListNode? = l2
        let dummy = ListNode()
        var current = dummy
        var sum = 0
        
        while x != nil || y != nil {
            sum /= 10
            if let _ = x {
                sum += x!.value as! Int
                x = x!.next
            }
            if let _ = y {
                sum += y!.value as! Int
                y = y!.next
            }
            current.next = ListNode(sum % 10)
            current = current.next!
        }
        if sum / 10 > 0 {
            current.next = ListNode(1)
        }
        
        return dummy.next!
    }
    
    //MARK: -   整数反转
    /// 示例：给定一个 32 位有符号整数，将整数中的数字进行反转。Int32.max值为214748367，Int32.min值为-2147483648
    /// - Parameter x: 32位整形数
    /// - Returns: 反转后的整型数
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
    
    //MARK: - 回文数
    /// 判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
    ///
    /// 示例：123，6789876
    /// - Parameter num: Int数
    /// - Returns: YES：是回文数 NO：不是
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
    
    /// 罗马数字包含以下七种字符: I， V， X， L，C，D 和 M。给定一个罗马数字，将其转换成整数。输入确保在 1 到 3999 的范围内。
    /// 示例 :
    /// 输入: "III"
    /// 输出: 3
    /// - Parameter s: 罗马数字
    /// - Returns: 整数
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
    
    //MARK: -  报数问题
    /// 有100个人比赛，一排站着报数，奇数的就出局了，报完以后从头再来，最后一个是赢家，选几号站可以留到最后
    /// 假设有n个人呢？
    ///
    /// 解析：第一次留偶数，2的倍数，第二次数再留偶数，也就是偶数中2的倍数也就是留4的倍数，依次数就是：第一次剩下2的倍数，第二次剩下4的倍数，第三次剩下8的倍数，第四次剩下16的倍数，第五次剩下32的倍数，第六次剩下64。第N轮留下2^n的倍数,如果队列长度是一个2的次方数那就是最后一个，否则就是小于它的最大2的次方数,转换成二进制问题：将这个数转换成二进制数，可以一目了然距离这个数最近的2个2的次方数，得到答案
    /// - Parameter queueLength: 队伍长度
    /// - Returns: 应该站在第几位
    func count2Win(queueLength:Int) -> Int{
        let str = String(queueLength,radix:2)
        let maxPower = str.count-1
        if queueLength > 2<<maxPower {
            return 2<<maxPower
        }else{
            return 2<<(maxPower-1)
        }
    }

    //MARK: -  公共前缀
    /// 编写一个函数来查找字符串数组中的最长公共前缀。如果不存在公共前缀，返回空字符串 ""。
    ///
    /// 示例：输入: ["flower","flow","flight"] 输出: "fl"
    /// - Parameter strs: 字符串数组
    /// - Returns: 返回公共字符串，没有公共返回空字符串
    func longestCommonPrefix(_ strs: [String]) -> String {
        let count = strs.count
        if count == 0 {
            return ""
        }
        if count == 1 {
            return strs.first!
        }
        var result = strs.first!
        for i in 1..<count {
            while !strs[i].hasPrefix(result) {
                result = String(result.prefix(result.count - 1))
                if result.count == 0 {
                    return ""
                }
            }
        }
        return result
    }
    
    //MARK: -  有效的括号
    /// 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。有效字符串需满足：左括号必须用相同类型的右括号闭合。左括号必须以正确的顺序闭合。注意空字符串可被认为是有效字符串。
    ///
    /// - Parameter str: 字符串
    /// - Returns: YES:满足要求 NO：不满足要求
    func validParentheses(str:String) -> Bool{
        var bucket = Stack<Character>()
        for c in str {
            switch c {
            case "{","[","(":
                bucket.push(element: c)
            case "}":
                guard (!bucket.isEmpty() && bucket.pop() == "{") else {
                    return false
                }
            case "]":
                guard (!bucket.isEmpty() && bucket.pop() == "[") else {
                    return false
                }
            case ")":
                guard (!bucket.isEmpty() && bucket.pop() == "(") else {
                    return false
                }
            default: break
            }
        }
        return bucket.isEmpty();
    }
    
    
    //MARK: -  二进制求和
    /// - Parameters:
    ///   - a: 二级制数 a
    ///   - b: 二级制数 b
    /// - Returns: 求和后的二进制数 字符串
    func addBinary(_ a: String, _ b: String) -> String {
        
        let DecimalA = self.binary2dec(num: a)
        let DecimalB = self.binary2dec(num: b)

        print("\(DecimalA),\(DecimalB)")
        let sum = String(DecimalA + DecimalB ,radix:2)
        return sum
    }
    
    private func binary2dec(num:String) -> Int64 {
        var result :Int64 = 0
        for c in String(result) {
            result = result * 2 + Int64("\(c)")!
        }
        return result
    }
    //MARK: -  加一
    /// 给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。
    /// 最高位数字存放在数组的首位， 数组中每个元素只存储一个数字。
    /// 你可以假设除了整数 0 之外，这个整数不会以零开头。
    /// 示例 1:
    /// 输入: [1,2,3]
    /// 输出: [1,2,4]
    /// 解释: 输入数组表示数字 123。
    func plusOne(_ digits: [Int]) -> [Int] {
        if digits.isEmpty {
            return digits
        }
        var digits = digits
        
        for i in (0..<digits.count).reversed() {
            if digits[i] < 9 {
                digits[i] += 1
                return digits
            }
            digits[i] = 0
        }
        //运行至此说明carray还是等于1，即全是9的情况，需要在首位插入数字1
        digits.insert(1, at: 0)
        return digits
    }
   
    //MARK: -  盛最多水的容器
    ///给定 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
    ///说明：不能倾斜容器，且 n 的值至少为 2。
    ///示例：

    func maxArea(_ height: [Int]) -> Int {
        var result = 0
        var left = 0;
        var right = height.count - 1;
        
        while left < right {
            let valleft = height[left]
            let valright = height[right]
            let area = (valleft > valright ? valright : valleft) * (right - left)
            if area > result {
                result = area
            }
            if valleft > valright {
                right -= 1
            } else {
                left += 1
            }
        }
        return result
    }
    
}





