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

// MARK: - Vector Global Functions

public func dot<T: AccelerateFloatingPoint>(x: [T], y: [T]) -> T {
    return T.dot(x, y: y)
}

public func cross<T: AccelerateFloatingPoint>(x: [T], y: [T]) -> [T] {
    return T.cross(x, y: y)
}

public func length<T: AccelerateFloatingPoint>(x: [T]) -> T {
    return T.length(x)
}

public func norm<T: AccelerateFloatingPoint>(x: [T]) -> T {
    return T.norm(x)
}

public func normalize<T: AccelerateFloatingPoint>(x: [T]) -> [T] {
    return  T.normalize(x)
}

// MARK: - Vector Array Extension

public extension Array where Element: AccelerateFloatingPoint {
    
    public func dotting(y: [Element]) -> Element {
        return Element.dot(self, y: y)
    }
    
    public func crossing(y: [Element]) -> [Element] {
        return Element.cross(self, y: y)
    }
    
    public func length() -> Element {
        return Element.length(self)
    }
    
    public func norm() -> Element {
        return Element.norm(self)
    }
    
    public func normalized() -> [Element] {
        return Element.normalize(self)
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