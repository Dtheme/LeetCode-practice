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
    public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
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
    public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
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
    public func reverse(_ x: Int) -> Int {
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
    public func isPalindromeNumber(num: Int) -> Bool{
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
    public func romanToInt(_ s: String) -> Int {
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
    public func count2Win(queueLength:Int) -> Int{
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
    public func longestCommonPrefix(_ strs: [String]) -> String {
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
    public func validParentheses(str:String) -> Bool{
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
    public func addBinary(_ a: String, _ b: String) -> String {
        
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
    public func plusOne(_ digits: [Int]) -> [Int] {
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

    public func maxArea(_ height: [Int]) -> Int {
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
    
    
    //MARK: -  翻转数组
    /// 给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
    /// 输入: [1,2,3,4,5,6,7] 和 k = 3
    /// 输出: [5,6,7,1,2,3,4]
    /// 解释:
    /// 向右旋转 1 步: [7,1,2,3,4,5,6]
    /// 向右旋转 2 步: [6,7,1,2,3,4,5]
    /// 向右旋转 3 步: [5,6,7,1,2,3,4]
    public func rotateArray(array:inout [Int], k:inout Int) -> NSArray{
        
        assert(k <= array.count && k >= 0, "-rotateArray “k” Value error：k的值不能大于数组的容量")
        
        k = k % array.count
        let result = NSMutableArray.init(array: array)
        for i in 0..<array.count {
            let index = (i + k) % array.count
            result[index] = array[i]
        }
        return result.copy() as! NSArray
    }
    
    //MARK: -  二叉树的层平均值
    ///示例：已知下面的二叉树
    ///     3 \n
    ///    / \
    ///   9  20
    ///     /  \
    ///    15   7
    /// 输出：分别是第0层，第1层，第2层的平均值 [3, 14.5, 11]
    ///
    /// 实现方式：双端队列实现
    /// - Parameter root: 传入指定的二叉树
    /// - Returns: 返回存放各层的平均值的数组 [Double]
    public func averageOfLevels(_ root: BinarySearchTreeNode<Int>?) -> [Double] {
        let result :NSMutableArray = []
        if root == nil {
            return result as! [Double]
        }
        var deque = Deque<BinarySearchTreeNode<Int>>()
        deque.enqueueTail(root!)
        while deque.isEmpty == false {
            let size = deque.count
            var sum = 0
            for _ in 0..<size {
                let node : BinarySearchTreeNode = deque.dequeueHead()!
                sum += node.value
                if node.leftNode != nil{
                    deque.enqueueTail(node.leftNode!)
                }
                if node.rightNode != nil{
                    deque.enqueueTail(node.rightNode!)
                }
            }
            let average : Double = Double(sum/size)
            result.add(average)
        }
        return result.copy() as! [Double]
    }
    
    //MARK: -  移动零
    ///给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
    ///
    /// 示例:
    /// 输入: [0,1,0,3,12]
    /// 输出: [1,3,12,0,0]
    public func moveZeroes(_ nums: inout [Int]) -> [Int] {
        var index1 = 0
        var index2 = nums.count
        while index1 <= index2 - 1 {
            if nums[index1] == 0 {
                for _ in 0..<(index2-index1) {
                    index2 -= 1
                    if nums[index2] != 0 {
                        nums.remove(at: index1)
                        nums.append(0)
                        break;
                    }
                }
            }else {
                index1 += 1
            }
        }
        return nums
    }
    

    //MARK: -  买卖股票的最佳时机I
    /// 给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。 如果你最多只允许完成一笔交易（即买入和卖出一支股票），设计一个算法来计算你所能获取的最大利润。 注意你不能在买入股票前卖出股票。
    ///
    /// 示例 1:
    /// 输入: [7,1,5,3,6,4]
    /// 输出: 5
    ///
    /// 解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。
    public func maxProfit(prices: inout [Int]) -> Int {
        var maxP = 0
        guard prices.count > 1 else { return 0 }
        var minP = prices[0]
        for i in 0..<prices.count {
            maxP = max(maxP, prices[i]-minP)
            minP = min(minP, prices[i])
        }
        return maxP
        
    }
    
    //MARK: -  买卖股票的最佳时机 II
    ///给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
    ///
    /// 示例 1:
    ///
    /// 输入: [7,1,5,3,6,4]
    /// 输出: 7
    ///
    /// 解释: 在第 2 天（股票价格 = 1）的时候买入，在第 3 天（股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。随后，在第 4 天（股票价格 = 3）的时候买入，在第 5 天（股票价格 = 6）的时候卖出, 这笔交易所能获得利润 = 6-3 = 3 。
    public func maxProfitII(_ prices: [Int]) -> Int {
        var max = 0
        
        guard prices.count > 1 else { return 0 }
        
        for i in 1..<prices.count where prices[i] > prices[i - 1] {
            max += prices[i] - prices[i - 1]
        }
        return max
    }
    
    //MARK: -  买卖股票的最佳时期III
    ///给定一个数组，它的第 i 个元素是一支给定的股票在第 i 天的价格。设计一个算法来计算你所能获取的最大利润。你最多可以完成 两笔 交易。注意: 你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
    ///
    /// 示例 1:
    ///
    /// 输入: [3,3,5,0,0,3,1,4]
    /// 输出: 6
    /// 解释: 在第 4 天（股票价格 = 0）的时候买入，在第 6 天（股票价格 = 3）的时候卖出，这笔交易所能获得利润 = 3-0 = 3 。随后，在第 7 天（股票价格 = 1）的时候买入，在第 8 天 （股票价格 = 4）的时候卖出，这笔交易所能获得利润 = 4-1 = 3 。
    public func maxProfitIII(prices:inout[Int]) -> Int {
        
        guard prices.count >= 1 else { return 0 }
        
        var global = Array.init(repeating: 0, count: 3)
        var local = Array.init(repeating: 0, count: 3)
        
        for i in 0..<prices.count-1 {
            
            let diff = prices[i+1] - prices[i]
            
            for j in (1...2).reversed(){
                local[j] = max(global[j-1] + max(diff, 0), local[j] + diff)
                global[j] = max(local[j], global[j])
            }
            
        }
        
        return global[2]
        
    }
    
    //MARK: -  只出现一次的数字I
    ///给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
    ///
    /// 说明：你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
    ///
    /// 示例 1:
    ///
    /// 输入: [2,2,1]
    /// 输出: 1
    public func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            result ^= num
        }
        return result
    }
    
    //MARK: -  只出现一次的数字II
    ///给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现了三次。找出那个只出现了一次的元素。
    ///
    ///说明：你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
    ///
    /// 示例 1:
    ///
    /// 输入: [2,2,3,2]
    /// 输出: 3
    public func singleNumberII(_ nums: [Int]) -> Int {
        var result = 0
        for i in 0..<32 {
            var count = 0;
            for j in 0..<nums.count{
                count+=(nums[j]>>i)&1
            }
            result += (count % 3)<<i
        }
        return result
    }
    
    
    //MARK: -  只出现一次的数字III
    ///给定一个整数数组 nums，其中恰好有两个元素只出现一次，其余所有元素均出现两次。 找出只出现一次的那两个元素。
    ///
    /// 示例 :
    ///
    /// 输入: [1,2,1,3,2,5]
    /// 输出: [3,5]
    public func singleNumberIII(_ nums: [Int]) -> [Int] {
        
        var ans : [Int] = [0,0]
        var ele = 0
        for i in 0..<nums.count {
            ele ^= nums[i]
        }
        
        ele &= -ele
        
        for j in 0..<nums.count{
            if (nums[j] & ele) != 0{
                ans[0] ^= nums[j]
            }else{
                ans[1] ^= nums[j]
            }
        }
        return ans
    }
    
    //MARK: -  打家劫舍I
    /// 你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。给定一个代表每个房屋存放金额的非负整数数组，计算你在不触动警报装置的情况下，能够偷窃到的最高金额。
    ///
    /// 示例 1:
    ///
    /// 输入: [1,2,3,1]
    /// 输出: 4
    /// 解释: 偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
    /// 偷窃到的最高金额 = 1 + 3 = 4 。
    ///
    /// - Parameter nums: 数组
    /// - Returns: 偷窃到的最大金额
    public func rob(_ nums: [Int]) -> Int {
        
        if nums.count == 0{ return 0 }
        if nums.count == 1 {
            return nums.max()!
        }
        var referenceArr = Array.init(repeating: 0, count: nums.count)
        referenceArr[0] =  nums[0]
        referenceArr[1] = max(nums[1], nums[0])
        for i in 2..<nums.count {
            referenceArr[i] = max(referenceArr[i-1], referenceArr[i-2]+nums[i])
        }
        
        return referenceArr[nums.count-1]
    }
 
    
    /// 你是一个专业的小偷，计划偷窃沿街的房屋，每间房内都藏有一定的现金。这个地方所有的房屋都围成一圈，这意味着第一个房屋和最后一个房屋是紧挨着的。同时，相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。给定一个代表每个房屋存放金额的非负整数数组，计算你在不触动警报装置的情况下，能够偷窃到的最高金额。
    ///
    /// 示例 1:
    ///
    /// 输入: [2,3,2]
    /// 输出: 3
    /// 解释: 你不能先偷窃 1 号房屋（金额 = 2），然后偷窃 3 号房屋（金额 = 2）, 因为他们是相邻的。
    ///
    /// - Parameter nums: 输入数组
    /// - Returns: 偷窃到的最大金额
    public func robII(_ nums: [Int]) -> Int{
        if nums.count <= 1 {
            return nums.isEmpty ? 0 : nums[0]
        }
        return robii(nums: nums, left: 0, right: nums.count-1)
    }
    
    private func robii(nums:[Int], left :Int, right:Int) -> Int{
        
        var a = 0 , b = 0
        for i in left..<right {
            let m = a,n = b
            a = n + nums[i]
            b = max(m, n)
        }
        return max(a, b)
    }
    
    
    
    /// 给定一个只包含数字的字符串，复原它并返回所有可能的 IP 地址格式。
    ///
    /// 示例:
    ///
    /// 输入: "25525511135"
    /// 输出: ["255.255.11.135", "255.255.111.35"]
    ///
    /// - Parameter s: 待复原字符串
    /// - Returns: 复原IP结果数组
    public func restoreIpAddresses(_ s: String) -> [String] {
        if s.count < 4 || s.count > 12 {
            return []
        }
        
        let characters = Array(s)
        var result = [String]()
        var candidate = [String]()
        
        backtracking(characters, 0, &candidate, &result)
        
        return result
    }
    private func backtracking(_ characters: [Character], _ pos: Int, _ candidate: inout [String], _ result: inout [String]) {
        if candidate.count == 4 {
            result.append(candidate.joined(separator: "."))
            return
        }
        
        let charsLeft = characters.count - pos
        let groupsLeft = 4 - candidate.count
        let minLen = groupsLeft == 1 ? charsLeft - groupsLeft + 1 : 1
        let maxLen = characters[pos] == "0" ? 1 : min(3, charsLeft - groupsLeft + 1)
        
        if minLen > maxLen {
            return
        }
        
        for len in minLen...maxLen {
            let num = String(characters[pos..<(pos + len)])
            if Int(num)! > 255 {
                continue
            }
            candidate.append(num)
            backtracking(characters, pos + len, &candidate, &result)
            candidate.removeLast()
        }
    }
    
    //MARK: -  网络延迟时间
    ///有 N 个网络节点，标记为 1 到 N。
    ///
    /// 给定一个列表 times，表示信号经过有向边的传递时间。 times[i] = (u, v, w)，其中 u 是源节点，v 是目标节点， w 是一个信号从源节点传递到目标节点的时间。
    ///
    /// 现在，我们向当前的节点 K 发送了一个信号。需要多久才能使所有节点都收到信号？如果不能使所有节点收到信号，返回 -1。
    ///
    /// 注意: N 的范围在 [1, 100] 之间。K 的范围在 [1, N] 之间。times 的长度在 [1, 6000] 之间。所有的边 times[i] = (u, v, w) 都有 1 <= u, v <= N 且 1 <= w <= 100。
    public func networkDelayTime(times:inout [[Int]], N: inout Int, K:inout Int) -> Int{
        var referenceArr : [Int] = Array.init(repeating: Int.max, count: N+1)
        referenceArr[K] = 0
        var loop = 1
        while loop != 0{
            loop -= 1
            for i in 0..<times.count {
                if(referenceArr[times[i][0]] != Int.max){
                    let t = referenceArr[times[i][1]]
                    referenceArr[times[i][1]] = min(referenceArr[times[i][0]]+times[i][2], referenceArr[times[i][1]])
                    if(t != referenceArr[times[i][1]]){
                        loop = 1
                    }
                }
            }
        }
        var maxnum = 0
        for j in 1...N {
            if(referenceArr[j] == Int.max){
                return -1
            }
            maxnum = max(maxnum, referenceArr[j])
        }
        return maxnum;
    }
    
    
}
