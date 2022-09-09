//
//  LeetBook_Algorithem_Intro.swift
//  LeetCode-practice
//
//  Created by dzw on 2022/9/7.
//  Copyright © 2022 dzw. All rights reserved.
//
//  Leetbook 初级算法
import Foundation


class LeetBook_Algorithem_Intro : NSObject {
    private static let instance = LeetBook_Algorithem_Intro();
    class var shardCollection: LeetBook_Algorithem_Intro {
        return instance;
    }
// MARK: ------------------------------数组------------------------------
    // MARK:  删除排序数组中的重复项
    //给你一个 升序排列 的数组 nums ，请你 原地 删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。元素的 相对顺序 应该保持 一致 。
    //
    //由于在某些语言中不能改变数组的长度，所以必须将结果放在数组nums的第一部分。更规范地说，如果在删除重复项之后有 k 个元素，那么 nums 的前 k 个元素应该保存最终结果。
    //
    //将最终结果插入 nums 的前 k 个位置后返回 k 。
    //不要使用额外的空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var count = 0;
        for right in 1..<nums.count {
            if nums[right] == nums[right-1] {//有重复的数据，count+1
                count += 1
            }else{//如果没有重复 right指针往后挪一个
                nums[right-count] = nums[right]
            }
        }
        return nums.count - count
    }
    
    // MARK: 旋转数组
    // 给你一个数组，将数组中的元素向右轮转 k 个位置，其中 k 是非负数。
    // eg:输入: nums = [1,2,3,4,5,6,7], k = 3
    // 输出: [5,6,7,1,2,3,4]
    //
    // 这个问题可以O(1)原地解决
    func rotate(_ nums: inout [Int], _ k: Int) {
        let k = k%nums.count
        if k==0||nums.count==1 {
            return
        }
        var num = 0
        for _ in 0..<k {
            num = nums.last!
            nums.removeLast()
            nums.insert(num, at: 0)
        }
    }
    // MARK: 存在重复元素
    // 给你一个整数数组 nums 。如果任一值在数组中出现 至少两次 ，返回 true ；如果数组中每个元素互不相同，返回 false 。
    // 示例 1：
    //
    // 输入：nums = [1,2,3,1]
    // 输出：true
    func containsDuplicate(_ nums: [Int]) -> Bool {
        if nums.count == 0 || nums.count == 1 {
            return false
        }
        let set: Set<Int> = Set.init(nums)
        return !(set.count == nums.count)
    }
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            result ^= num
        }
        return result
    }
    
    // MARK:两个数组的交集
    // 给你两个整数数组 nums1 和 nums2 请你以数组形式返回两数组的交集,返回结果中每个元素出现的次数,应与元素在两个数组中都出现的次数一致（如果出现次数不一致，则考虑取较小值）,可以不考虑输出结果的顺序。
    // 输入：nums1 = [4,9,5], nums2 = [9,4,9,8,4]
    // 输出：[4,9]
    func intersect(_ nums1: inout [Int], _ nums2: inout [Int]) -> [Int] {
        nums1.sort()
        nums2.sort()
        var i = 0
        var j = 0
        var result : [Int] = []
        while i<nums1.count && j<nums2.count {
            if nums1[i] == nums2[j] {
                result.append(nums1[i]);
                i += 1
                j += 1
            }else if  nums1[i] < nums2[j] {
                j += 1
            } else {
                i += 1
            }
        }
        return result
    }
    
    func intersect2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict = [Int: Int]()
        for num in nums1 {
            if dict[num] == nil { dict[num] = 0 }
            dict[num] = dict[num]! + 1
        }
        var result = [Int]()
        for num in nums2 {
            if let count = dict[num], count > 0 {
                dict[num] = dict[num]! - 1
                result.append(num)
                if dict[num]! == 0 {
                    dict[num] = nil
                }
            }
        }
        print(result)
        return result
    }
    
    // MARK: -  加一
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
 
    // MARK: 有效的数独
    // 请你判断一个 9 x 9 的数独是否有效。只需要 根据以下规则 ，验证已经填入的数字是否有效即可。
    //
    // 数字 1-9 在每一行只能出现一次。
    // 数字 1-9 在每一列只能出现一次。
    // 数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。（请参考示例图）
    //  eg:https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2021/04/12/250px-sudoku-by-l2g-20050714svg.png
    //  输入：board =
    //    [["5","3",".",".","7",".",".",".","."]
    //    ,["6",".",".","1","9","5",".",".","."]
    //    ,[".","9","8",".",".",".",".","6","."]
    //    ,["8",".",".",".","6",".",".",".","3"]
    //    ,["4",".",".","8",".","3",".",".","1"]
    //    ,["7",".",".",".","2",".",".",".","6"]
    //    ,[".","6",".",".",".",".","2","8","."]
    //    ,[".",".",".","4","1","9",".",".","5"]
    //    ,[".",".",".",".","8",".",".","7","9"]]
    //  输出：true
    //
    func isValidSudoku(_ board: [[String]]) -> Bool {
        var rowSets: [Set<String>] = Array.init(repeating: Set<String>(), count: 9)
        var colSets: [Set<String>] = Array.init(repeating: Set<String>(), count: 9)
        var squareSets: [Set<String>] = Array.init(repeating: Set<String>(), count: 9)
        for (row, chars) in board.enumerated() {
            for (col, char) in chars.enumerated() {
                if char == "." { continue }
                guard !rowSets[row].contains(char) else { return false }
                rowSets[row].insert(char)
                guard !colSets[col].contains(char) else { return false }
                colSets[col].insert(char)
                let squareIndex = (row / 3) * 3 + (col / 3)
                guard !squareSets[squareIndex].contains(char) else { return false }
                squareSets[squareIndex].insert(char)
            }
        }
        return true
    }
    
}
