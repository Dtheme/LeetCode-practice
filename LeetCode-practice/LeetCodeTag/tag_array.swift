//
//  tag_array.swift
//  LeetCode-practice
//
//  Created by dzw on 2019/11/1.
//  Copyright © 2019 dzw. All rights reserved.
//
//  数组联系 题目描述前标号为leetcode题号
//

import UIKit

class tag_array: NSObject {
    
    /*
     26. 给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
     不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。
     
     给定数组 nums = [1,1,2],函数应该返回新的长度 2, 并且原数组 nums 的前两个元素被修改为 1, 2。
     你不需要考虑数组中超出新长度后面的元素。
     */
    func removeDuplicates(_ nums:inout[Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var p = 0
        var q = 1
        while q < nums.count {
            if nums[p] != nums[q] {
                if q - p > 1 {
                    nums[p+1] = nums[q]
                }
                p += 1
            }
            q += 1
        }
        return p + 1
    }
    
    /*
     495.在《英雄联盟》的世界中，有一个叫 “提莫” 的英雄，他的攻击可以让敌方英雄艾希（编者注：寒冰射手）进入中毒状态。现在，给出提莫对艾希的攻击时间序列和提莫攻击的中毒持续时间，你需要输出艾希的中毒状态总时长。
     
     你可以认为提莫在给定的时间点进行攻击，并立即使艾希处于中毒状态。
     
     eg:
     1.输入: [1,4], 2
     输出: 4
     原因: 在第 1 秒开始时，提莫开始对艾希进行攻击并使其立即中毒。中毒状态会维持 2 秒钟，直到第 2 秒钟结束。
     在第 4 秒开始时，提莫再次攻击艾希，使得艾希获得另外 2 秒的中毒时间。
     所以最终输出 4 秒。
     2.输入: [1,2], 2
     输出: 3
     原因: 在第 1 秒开始时，提莫开始对艾希进行攻击并使其立即中毒。中毒状态会维持 2 秒钟，直到第 2 秒钟结束。
     但是在第 2 秒开始时，提莫再次攻击了已经处于中毒状态的艾希。
     由于中毒状态不可叠加，提莫在第 2 秒开始时的这次攻击会在第 3 秒钟结束。
     所以最终输出 3。
     */
    class Solution {
        func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
            let n = timeSeries.count
            if n == 0 {
                return 0;
            }
            var res = 0
            for i in 0..<n-1 {
                if timeSeries[i]+duration <= timeSeries[i+1] {
                    res = res + duration
                }else{
                    res = res + (timeSeries[i+1] - timeSeries[i])
                }
            }
            return res + duration
        }
    }
    
    
    
}
