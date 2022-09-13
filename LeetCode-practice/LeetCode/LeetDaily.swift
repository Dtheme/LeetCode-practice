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
    
    // MARK: 2022年09月13日 670. 最大交换
    //
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
}
