//
//  LinkList.swift
//  LeetCode-practice
//
//  Created by dzw on 2018/9/7.
//  Copyright © 2018年 dzw. All rights reserved.
//  链表
//

import UIKit

class LinkedList: NSObject {
    var head:ListNode?
    var tail:ListNode?
    
    func appendToHead(value: Int) {
        if head == nil {
            head = ListNode(value)
            tail = head
        } else {
            let temp = ListNode(value)
            temp.next = head
            head = temp
        }
    }
    
    func appendToTail(value: Int) {
        if tail == nil {
            tail = ListNode(value)
            head = tail
        } else {
            tail!.next = ListNode(value)
            tail = tail!.next
        }
    }
}

class ListNode : CustomDebugStringConvertible{
    var value:Int
    var next:ListNode?
    
    init(_ value: Int = 0, _ next: ListNode? = nil) {
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

