//
//  LeetBook_Algorithem_Intro.swift
//  LeetCode-practiceTests
//
//  Created by dzw on 2022/9/7.
//  Copyright © 2022 dzw. All rights reserved.
//

import Foundation

@testable import LeetCode_practice
import XCTest


class LeetBookAlgorithemIntroTest: XCTestCase {
    let leetbook_ez = LeetBook_Algorithem_Intro.shardCollection
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    //MARK: - 删除
    func testRemoveDuplicates() {
        var nums = [0,0,1,1,1,2,2,3,3,4]
        let result = leetbook_ez.removeDuplicates(&nums)
        print(result)
    }
    
    func testRotate() {
        var nums = [1,2,3,4,5,6,7]
        let result: () = leetbook_ez.rotate(&nums, 3)
        print(result)
    }
    
    func testIntersect() {
        var nums1 = [1,2,2,1]
        var nums2 = [1,2,2,1]
        let result:[Int] = leetbook_ez.intersect(&nums1,&nums2)
    }
    func testIntersect2() {
        var nums1 = [1,2,3,4,2,2,1,7]
        var nums2 = [3,4,2,7]
        let result:[Int] = leetbook_ez.intersect2(nums1, nums2)
    }
    func testIsValidSudoku()  {
        let board =
        [["5","3",".",".","7",".",".",".","."],["5",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
        var res = leetbook_ez.isValidSudoku(board)
        print(res)
    }
}

