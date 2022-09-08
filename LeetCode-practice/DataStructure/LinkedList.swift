//
//  LinkList.swift
//  LeetCode-practice
//
//  Created by dzw on 2018/9/7.
//  Copyright © 2018年 dzw. All rights reserved.
//
//  链表
//

import Foundation

class LinkedList: NSObject {
   
    var head:ListNode?
    var tail:ListNode?
    var count : Int {
        get{
            var node = head
            var count = 0
            while node != nil {
                node = node!.next
                count += 1
            }
            return count
        }
    }
    public func appendToHead(value: ListNode) {
        if head == nil {
            head = value
            tail = head
            
        } else {
            let temp = value
            temp.next = head
            head = temp
        }
    }
    

    public func appendToTail(value: ListNode) {
        if tail == nil {
            tail = value
            head = tail
        } else {
            tail!.next = value
            tail = value.pre
            tail = tail!.next
        }
    }
    
    //MARK: -  通过index访问节点
    public func nodeAt(index: Int) -> ListNode? {
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 {
                    return node
                }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }
    
    //MARK: -  清空链表
    public func removeAll() {
        var next = head
        while next != nil {
            let tmp = next
            next?.next = nil
            next = tmp
        }
        head = nil
        tail = nil
    }
    

    //MARK: -  打印内容
    override public var description: String {
        var text = "["
        var node = head
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }
        return text + "]"
    }

}


//MARK: -  节点
class ListNode : CustomDebugStringConvertible{
    var value:Any
    var next:ListNode?
    var pre:ListNode?
    
    init(_ value: Any = 0, _ next: ListNode? = nil) {
        self.value = value
        self.next = nil
    }
    
    var debugDescription: String {
        var s = "\(value)"
        var p = self
        while p.next != nil {
            p = p.next!
            s = "\(s) \(p.value)"
        }
        return s
    }
   
}

