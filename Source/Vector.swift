//
//  Vector.swift
//  Surge
//
//  Created by Tyler Fleming Cloutier on 1/18/16.
//  Copyright © 2016 Mattt Thompson. All rights reserved.
//

// MARK: Normalization

extension AccelerateFloatingPoint {
    public static func normalize<T: AccelerateFloatingPoint>(x: [T]) -> [T] {
        return  x / T.norm(x)
    }
}

// MARK: - Operators

infix operator • {}
public func •<T: AccelerateFloatingPoint>(lhs: [T], rhs: [T]) -> T {
    return T.dot(lhs, y: rhs)
}

infix operator ⨯ {}
public func ⨯<T: AccelerateFloatingPoint>(lhs: [T], rhs: [T]) -> [T] {
    return T.cross(lhs, y: rhs)
}