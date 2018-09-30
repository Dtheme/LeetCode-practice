//
//  SortAlgorithem.swift
//  LeetCode-practice
//
//  Created by dzw on 2018/9/30.
//  Copyright © 2018年 dzw. All rights reserved.
//

import UIKit


class SortAlgorithem: NSObject {

    private static let instance = SortAlgorithem();
    class var shardCollection: SortAlgorithem {
        return instance;
    }
    
    
    //MARK: -  冒泡 时间复杂度O(n^2) 最好O(n) 最坏O(n^2) 空间复杂度O(1)
    /*
     比较相邻的元素。如果第一个比第二个大，就交换它们两个；
     对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对，这样在最后的元素应该会是最大的数；
     针对所有的元素重复以上的步骤，除了最后一个；
     重复步骤1~3，直到排序完成。
    */
    func bubbleSort(array : NSArray) -> NSArray{
        let arr = NSMutableArray.init(array: array)
        for i in 0..<arr.count - 1 {
            for j in 0..<arr.count - 1 - i {
                if arr[j] as! Int > arr[j+1] as! Int{
                    swap(&arr[j], &arr[j+1])
                }
            }
        }
        return arr;
    }
    //MARK: -  选择排序 时间复杂度O(n^2) 最好O(n^2) 最坏O(n^2) 空间复杂度O(1)
    /*
     n个记录的直接选择排序可经过n-1趟直接选择排序得到有序结果。具体算法描述如下：
     初始状态：无序区为R[1..n]，有序区为空；
     第i趟排序(i=1,2,3…n-1)开始时，当前有序区和无序区分别为R[1..i-1]和R(i..n）。该趟排序从当前无序区中-选出关键字最小的记录 R[k]，将它与无序区的第1个记录R交换，使R[1..i]和R[i+1..n)分别变为记录个数增加1个的新有序区和记录个数减少1个的新无序区；
     n-1趟结束，数组有序化了。
     */
    
    func selectionSort(array : NSMutableArray) -> NSArray{
        var minIndex : Int
        for i in 0..<array.count-1 {
           minIndex = i
            for j in i..<array.count{
                if array[minIndex] as! Int > array[j] as! Int{
                    minIndex = j
                }
            }
            swap(&array[i], &array[minIndex])
        }
        return array
    }
    
    //MARK: -  插入排序 时间复杂度O(n^2) 最好O(n) 最坏O(n^2) 空间复杂度O(1)
    /*
     一般来说，插入排序都采用in-place在数组上实现。具体算法描述如下：
     
     从第一个元素开始，该元素可以认为已经被排序；
     取出下一个元素，在已经排序的元素序列中从后向前扫描；
     如果该元素（已排序）大于新元素，将该元素移到下一位置；
     重复步骤3，直到找到已排序的元素小于或者等于新元素的位置；
     将新元素插入到该位置后；
     重复步骤2~5。
     */
    func insertionSort(array : NSMutableArray) -> NSArray{
        var preIndex = 0
        var curValue = 0
        for i in 1..<array.count {
            preIndex = i-1
            curValue = array[i] as! Int
            while preIndex >= 0 && array[preIndex] as! Int > curValue {
                array[preIndex + 1] = array[preIndex]
                preIndex -= 1
            }
            array[preIndex + 1] = curValue
        }
        return array
    }
    //MARK: -  希尔排序 时间复杂度O(n^(1.3—2)) 最好O(n) 最坏O(n^2) 空间复杂度O(1)
    /*
     先将整个待排序的记录序列分割成为若干子序列分别进行直接插入排序，具体算法描述：
     
     选择一个增量序列t1，t2，…，tk，其中ti>tj，tk=1；
     按增量序列个数k，对序列进行k 趟排序；
     每趟排序，根据对应的增量ti，将待排序列分割成若干长度为m 的子序列，分别对各子表进行直接插入排序。仅增量因子为1 时，整个序列作为一个表来处理，表长度即为整个序列的长度。
     */
    func shellSort(array : NSMutableArray) -> NSArray{
        var distence = array.count/2
        while distence > 0 {
            for i in 0..<array.count{
                guard i + distence < array.count else{
                    break
                }
                if array[i] as! Int > array[i + distence] as! Int {
                    swap(&array[i], &array[i + distence])
                }
                guard distence == 1 && i > 0 else {
                    continue
                }
                if array[i - 1] as! Int > array[i] as! Int {
                    swap(&array[i - 1], &array[i])
                }
            }
            distence = distence/2
        }
        return array
    }
    
    //MARK: -  归并排序 时间复杂度O(nlog_2 n) 最好O(nlog_2 n) 最坏O(nlog_2 n) 空间复杂度O(n)
    /*
     把长度为n的输入序列分成两个长度为n/2的子序列；
     对这两个子序列分别采用归并排序；
     将两个排序好的子序列合并成一个最终的排序序列。
     */
    //左右归并
    func mergeSort(array : [Int]) -> [Int]{
        guard array.count > 1 else { return array }    // 1
        let middleIndex = array.count / 2              // 2
        let leftArray = mergeSort(array: Array(array[0..<middleIndex]))             // 3
        let rightArray = mergeSort(array: Array(array[middleIndex..<array.count]))  // 4
        return merge(leftPile: leftArray, rightPile: rightArray)
    }
    
    //合并
    func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {

        var leftIndex = 0
        var rightIndex = 0

        var orderedPile = [Int]()
        
        while leftIndex < leftPile.count && rightIndex < rightPile.count {
            if leftPile[leftIndex] < rightPile[rightIndex] {
                orderedPile.append(leftPile[leftIndex])
                leftIndex += 1
            } else if leftPile[leftIndex] > rightPile[rightIndex] {
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1
            } else {
                orderedPile.append(leftPile[leftIndex])
                leftIndex += 1
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1
            }
        }
        while leftIndex < leftPile.count {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        }
        while rightIndex < rightPile.count {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
        return orderedPile
    }

}


