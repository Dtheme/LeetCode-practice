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

    

}
