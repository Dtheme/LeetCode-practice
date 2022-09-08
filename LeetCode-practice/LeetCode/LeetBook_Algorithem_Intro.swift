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
        var num = 0
        for _ in 0..<k {
            num = nums.last!
            nums.removeLast()
            nums.insert(num, at: 0)
        }
    }
    
    func rotate2(_ nums: inout [Int], _ k: Int){
        let k = k%nums.count
        if k==0||nums.count==1 {return}
        var nums2 = [Int]()
        for i in nums.count-k...nums.count-1{
            nums2.append(nums[i])
        }
        for _ in 1...k{
            nums.removeLast()
        }
        nums = nums2+nums
        print(nums)
    }
}
