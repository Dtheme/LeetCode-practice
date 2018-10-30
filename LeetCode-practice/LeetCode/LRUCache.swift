//
//  LRUCache.swift
//  LeetCode-practice
//
//  Created by dzw on 2018/10/30.
//  Copyright © 2018 dzw. All rights reserved.
//
//  运用所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制。它应该支持以下操作： 获取数据 get 和 写入数据 put 。
//
//  获取数据 get(key) - 如果密钥 (key) 存在于缓存中，则获取密钥的值（总是正数），否则返回 -1。
//  写入数据 put(key, value) - 如果密钥不存在，则写入其数据值。当缓存容量达到上限时，它应该在写入新数据之前删除最近最少使用的数据值，从而为新的数据值留出空间。
//
//  进阶:
//
//  你是否可以在 O(1) 时间复杂度内完成这两种操作？
//
//  示例:
//
//  LRUCache cache = new LRUCache( 2 /* 缓存容量 */ );
//
//  cache.put(1, 1);
//  cache.put(2, 2);
//  cache.get(1);       // 返回  1
//  cache.put(3, 3);    // 该操作会使得密钥 2 作废
//  cache.get(2);       // 返回 -1 (未找到)
//  cache.put(4, 4);    // 该操作会使得密钥 1 作废
//  cache.get(1);       // 返回 -1 (未找到)
//  cache.get(3);       // 返回  3
//  cache.get(4);       // 返回  4


import Foundation

/// 采用链表实现LRU（least recently used缓存淘汰算法）.
///
/// 思路:每次新插入的数据放在head，有新数据就插入，如果访问已有数据，就移动到表头，如果链表满了，从尾部移除

fileprivate class LRUCacheNode {
    var prev: LRUCacheNode?
    var next: LRUCacheNode?
    var value: Any?
    var key = ""
    deinit{
        print("\(self.key) is die")
    }
}

class LURCache {
    private var cacheSize = 0
    lazy private var nodes :[String: LRUCacheNode] = [:]
    private var currentSize = 0
    private var head: LRUCacheNode?//头节点
    private var tail: LRUCacheNode?//尾节点
    
    /// 构造方法
    ///
    /// - Parameter cacheSize: 缓存池的大小
    init(cacheSize :Int){
        self.cacheSize = cacheSize
    }
    
    
    /// 根据key获取一个值
    ///
    /// - Parameter key: type:String
    /// - Returns: 存储的值
    func get(key : String) -> Any? {
        let referenceNode = nodes[key]
        move2Head(node: referenceNode)
        return referenceNode?.value
    }
    
    
    /// 插入一个键值对 key：value
    ///
    /// - Parameters:
    ///   - key: type：String
    ///   - value: type：Any
    func put(key: String , value: Any){
        var referenceNode = nodes[key]
        if nil == referenceNode {
            if currentSize >= cacheSize {
                removeLast()
            }
            currentSize += 1
            referenceNode = LRUCacheNode()
        }
        referenceNode!.key = key
        referenceNode!.value = value
        move2Head(node: referenceNode!)
        nodes[key] = referenceNode
    }
    
    
    /// 根据key移除一个值
    ///
    /// - Parameter key: type：String
    /// - Returns: 移除的节点值 type：Any
    @discardableResult func remove(key : String) -> Any?{
        let referenceNode = nodes[key]
        if let node = referenceNode {
            if node.prev != nil {
                node.prev?.next = node.next
            }
            if node.next != nil {
                node.next?.prev = node.prev
            }
            if tail === referenceNode{
                tail = referenceNode?.prev
            }
            
            if head === referenceNode {
                head = referenceNode?.next
            }
            nodes[key] = nil
            currentSize -= 1
        }
        return referenceNode?.value
    }
    
    ///清空缓存池
    func clear(){
        head = nil
        tail = nil
        nodes.removeAll()
    }
    
    private func removeLast(){
        if let lastn = tail {
            nodes[lastn.key] = nil
            currentSize -= 1
            if let lastPre = lastn.prev {
                lastPre.next = nil
            }else{
                head = nil
            }
            tail = tail?.prev
        }
    }
    
    
    private func move2Head(node: LRUCacheNode?){
        if let n = node {
            if node === head{return}
            
            if n.prev != nil {
                n.prev?.next = n.next
            }
            
            if n.next != nil{
                n.next?.prev = n.prev
            }
            
            if tail === node{
                tail  = n.prev
            }
            
            if head != nil {
                n.next = head
                head?.prev = n
            }
            
            head = node
            n.prev = nil
            
            if tail == nil{
                tail  = head
            }
        }
    }
}
