//
//  LeetDaily.swift
//  LeetCode-practice
//
//  Created by dzw on 2022/9/13.
//  Copyright © 2022 dzw. All rights reserved.
//
//  leetCode 每日一题

import Foundation

class LeetDaily:NSObject {
    
    private static let instance = LeetDaily();
    class var shardCollection: LeetDaily {
        return instance;
    }
    
    func testSingle() -> Void {
        print("run single")
    }
    
    // MARK:670. 最大交换
    // 2022年09月13日
    // 给定一个非负整数，你至多可以交换一次数字中的任意两位。返回你能得到的最大值。
    // eg:输入: 2736
    //    输出: 7236
    //    解释: 交换数字2和数字7。
    // eg:输入: 9973
    //    输出: 9973
    //    解释: 不需要交换。
    func maximumSwap(_ num: Int) -> Int {
        if num<=0 {
            return num
        }
        let numString = String(num)
        var numChars = Array(numString)
        let numCharsSort = numChars.sorted(by:>)
        
        for i in 0..<numCharsSort.count {
            let value = numChars[i]
            let t = numCharsSort[i]
            if value == t {continue}
            else{
                let index = numChars.lastIndex(of:t)!
                numChars.swapAt(i,index)
                break
            }
        }
        var str = ""
        for s in numChars {
            str = str + String(s)
        }
        
        return Int(str)!
    }
    // MARK: 1619. 删除某些元素后的数组均值
    // 2022年09月14日
    // 给你一个整数数组 arr ，请你删除最小 5% 的数字和最大 5% 的数字后，剩余数字的平均值。
    //
    // 与 标准答案 误差在 10-5 的结果都被视为正确结果。
    // eg: 输入：arr = [1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3]
    //     输出：2.00000
    //     解释：删除数组中最大和最小的元素后，所有元素都等于 2，所以平均值为 2
    func trimMean(_ arr: [Int]) -> Double {
        var arr = arr
        arr.sort()
        let count = Int(Double(arr.count) * 0.05)
        var sum = 0
        for i in count..<(arr.count - count) {
            sum += arr[i]
        }
        return Double(sum) / Double(arr.count - 2 * count)
    }
}
