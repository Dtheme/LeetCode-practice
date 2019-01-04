//
//  Vertex.swift
//  LeetCode-practice
//
//  Created by dzw on 2019/1/4.
//  Copyright © 2019 dzw. All rights reserved.
//

import Foundation

public struct Vertex<T>: Equatable where T: Hashable {
    
    public var data: T
    public let index: Int
    
}

extension Vertex: CustomStringConvertible {
    
    public var description: String {
        return "\(index): \(data)"
    }
    
}

extension Vertex: Hashable {
    
    public var hashValue: Int {
        return "\(data)\(index)".hashValue
    }
    
}

public func ==<T>(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
    guard lhs.index == rhs.index else {
        return false
    }
    
    guard lhs.data == rhs.data else {
        return false
    }
    
    return true
}

