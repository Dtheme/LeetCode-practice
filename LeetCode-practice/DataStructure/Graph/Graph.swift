//
//  Graph.swift
//  LeetCode-practice
//
//  Created by dzw on 2019/1/4.
//  Copyright © 2019 dzw. All rights reserved.
//
//
//  图的实现是参照《Swift Data Structure and Algorithem》中图相关的讲解和实现而来
//

import Foundation

open class Graph<T>: CustomStringConvertible where T: Hashable {
    
    //MARK: -  构造方法
    public required init() {}
    
    public required init(fromGraph graph: Graph<T>) {
        for edge in graph.edges {
            let from = createVertex(edge.from.data)
            let to = createVertex(edge.to.data)
            
            addDirectedEdge(from, to: to, withWeight: edge.weight)
        }
    }
    
    open var description: String {
        fatalError("abstract property accessed")
    }
    
    open var vertices: [Vertex<T>] {
        fatalError("abstract property accessed")
    }
    
    open var edges: [Edge<T>] {
        fatalError("abstract property accessed")
    }
    
    //MARK: -  创建顶点
    open func createVertex(_ data: T) -> Vertex<T> {
        fatalError("abstract function called")
    }
    
    open func addDirectedEdge(_ from: Vertex<T>, to: Vertex<T>, withWeight weight: Double?) {
        fatalError("abstract function called")
    }
    
    open func addUndirectedEdge(_ vertices: (Vertex<T>, Vertex<T>), withWeight weight: Double?) {
        fatalError("abstract function called")
    }
    
    open func weightFrom(_ sourceVertex: Vertex<T>, to destinationVertex: Vertex<T>) -> Double? {
        fatalError("abstract function called")
    }
    
    open func edgesFrom(_ sourceVertex: Vertex<T>) -> [Edge<T>] {
        fatalError("abstract function called")
    }
}
