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
    private func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {

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

    //MARK: -  快速排序 时间复杂度O(nlog_2 n) 最好O(nlog_2 n) 最坏O(n^2)  空间复杂度O(nlog_2 n)
    /*
     快速排序使用分治法来把一个串（list）分为两个子串（sub-lists）。具体算法描述如下：
     
     从数列中挑出一个元素，称为 “基准”（pivot）；
     重新排序数列，所有元素比基准值小的摆放在基准前面，所有元素比基准值大的摆在基准的后面（相同的数可以到任一边）。在这个分区退出之后，该基准就处于数列的中间位置。这个称为分区（partition）操作；
     递归地（recursive）把小于基准值元素的子数列和大于基准值元素的子数列排序。
     */
    func quickSort(array:inout Array<Int>) -> Array<Int> {
        var list =  array
        quickSortArray(array: &list, starIndex: 0, endIndex: array.count-1)
        return list
    }
    
    private func quickSortArray(array:inout Array<Int>,starIndex:Int, endIndex:Int) -> (){
        if starIndex >= endIndex {return}
        var i = starIndex
        var j = endIndex
        let referenceValue = array[i]
        while(i < j){
            while (i < j && array[j] >= referenceValue) {
                j -= 1
            }
            array[i] = array[j]
            while (i < j && array[i] <= referenceValue) {
                i += 1
            }
            array[j] = array[i]
        }
         array[i] = referenceValue
        
        //左右2边各做一次排序
        self.quickSortArray(array: &array, starIndex: starIndex, endIndex: i-1)
        self.quickSortArray(array: &array, starIndex: i+1, endIndex: endIndex)
    }
    //MARK: -  桶排序 时间复杂度O(n+k) 最好O(n) 最坏O(n^2) 空间复杂度O(n+k)
    /*
     设置一个定量的数组当作空桶；
     遍历输入数据，并且把数据一个一个放到对应的桶里去；
     对每个不是空的桶进行排序；
     从不是空的桶里把排好序的数据拼接起来。
     */
    func bucketSort(array:inout Array<Int>,gap:NSInteger) -> NSArray{
        var min:Int = array[0]
        var max:Int = array[0]
        
        for i in 0..<array.count {
            if array[i] < min {
                min = array[i]
            }
            
            if array[i] > max {
                max = array[i]
            }
        }
        
        return self.bucket(arr: &array, min: min, max: max, gap: gap)
    }
    
    private func bucket(arr:inout [Int],min:Int,max:Int,gap:Int) -> NSArray {
        
        var bucketlist:[[Int]] = []
        let bucketCount:Int = (max - min) / gap + 1
        // 创建桶
        for _ in 0..<bucketCount {
            let temp:[Int] = []
            bucketlist.append(temp)
        }
        // 分桶
        for i in 0..<arr.count {
            let index:Int = (arr[i] - min) / gap
            bucketlist[index].append(arr[i])
        }
        // 小桶先排一下序
        for i in 0..<bucketCount {
            if bucketlist[i].count > 0 {
                buketInnerSort(arr: &bucketlist[i])
            }
        }
        var index:Int = 0
        for i in 0..<bucketCount {
            var bucket:[Int] = bucketlist[i]
            if bucket.count > 0 {
                for j in 0..<bucket.count {
                    arr[index] = bucket[j]
                    index += 1
                }
            }
        }
        return arr as NSArray
    }
    
    private func buketInnerSort(arr:inout [Int])  {
        let count:Int = arr.count
        for i in 1..<count {
            for j in (1...i).reversed() {
                if arr[j] < arr[j-1] {
                    arr.swapAt(j, j-1)
                }
            }
        }
    }
    
    //MARK: -  堆排序 时间复杂度O(nlog_2 n) 最好O(nlog_2 n) 最坏O(nlog_2 n)  空间复杂度O(1)
    /*
     将初始待排序关键字序列(R1,R2….Rn)构建成大顶堆，此堆为初始的无序区；
     将堆顶元素R[1]与最后一个元素R[n]交换，此时得到新的无序区(R1,R2,……Rn-1)和新的有序区(Rn),且满足R[1,2…n-1]<=R[n]；
     由于交换后新的堆顶R[1]可能违反堆的性质，因此需要对当前无序区(R1,R2,……Rn-1)调整为新堆，然后再次将R[1]与无序区最后一个元素交换，得到新的无序区(R1,R2….Rn-2)和新的有序区(Rn-1,Rn)。不断重复此过程直到有序区的元素个数为n-1，则整个排序过程完成。
     */
    func HeapSort(array:inout Array<Int>) -> NSArray {
        //1.构建大顶堆
        for i in (0...(array.count/2-1)).reversed(){
            //从第一个非叶子结点从下至上，从右至左调整结构
            self.adjustHeap(array: &array, i: i, length: array.count)
        }
        //2.调整堆结构+交换堆顶元素与末尾元素
        for j in  (1...(array.count-1)).reversed(){
            array.swapAt(0, j)
            self.adjustHeap(array: &array, i: 0, length: j)//重新对堆进行调整
        }
        return array as NSArray
    }
    

    //在大顶堆已构建之后调整堆
    private func adjustHeap(array:inout Array<Int>,i:Int,length:Int){
        var i = i;
        let temp = array[i];//先取出当前元素i
        var k=2*i+1
        while k<length {//从i结点的左子结点开始，也就是2i+1处开始
            if(k+1<length && array[k]<array[k+1]){//如果左子结点小于右子结点，k指向右子结点
                k+=1;
            }
            if(array[k] > temp){//如果子节点大于父节点，将子节点值赋给父节点（不用进行交换）
                array[i] = array[k];
                i = k;
            }else{
                break;
            }
            k=k*2+1
        }
        array[i] = temp;//将temp值放到最终的位置
    }
    
    //MARK: -  计数排序 时间复杂度O(n+k) 最好O(n+k) 最坏O(n+k) 空间复杂度O(n+k)
    /*
     找出待排序的数组中最大和最小的元素
     统计数组中每个值为i的元素出现的次数，存入数组C的第i项
     对所有的计数累加（从C中的第一个元素开始，每一项和前一项相加)
     反向填充目标数组：将每个元素i放在新数组的第C(i)项，每放一个元素就将C(i)减去1
     这种方式适用于那种数组中的最大的那个数不大，但是数组中存在很多重复数据的情况
     */
    func countingSort(array:inout [Int]) -> NSArray{
        var max:Int = array[0]
        
        for i in 0..<array.count {
            if array[i] > max {
                max = array[i]
            }
        }
        
        return self.counting(array: &array, maxValue: max) as NSArray
    }
    private func counting(array: inout [Int],maxValue:Int) -> [Int] {
       
        var bucket : [Int]  = Array.init(repeating : 0, count: maxValue + 1)
        var sortIndex = 0
        let arrayCount = array.count
        let bucketCount = maxValue + 1
        
        for i in 0..<arrayCount {
            let key : Int = array[i]
            bucket[key] += 1
        }
        
        for j in 0..<bucketCount {
            while bucket[j] > 0 {
                array[sortIndex] = j
                sortIndex += 1
                bucket[j] -= 1
            }
        }
        return array
    }

}
