//
//  Vector.swift
//  Surge
//
//  Created by Tyler Fleming Cloutier on 1/18/16.
//  Copyright © 2016 Mattt Thompson. All rights reserved.
//

// MARK: Normalization

extension AccelerateFloatingPoint {
    public static func normalized<T: AccelerateFloatingPoint>(x: [T]) -> [T] {
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

// MARK: - Vector CollectionType Extension

public extension CollectionType where Generator.Element: AccelerateFloatingPoint {
    
    public func dotting(y: [Generator.Element]) -> Generator.Element {
        return Generator.Element.dot(Array(self), y: y)
    }
    
    public func crossing(y: [Generator.Element]) -> [Generator.Element] {
        return Generator.Element.cross(Array(self), y: y)
    }
    
    public func length() -> Generator.Element {
        return Generator.Element.length(Array(self))
    }
    
    public func norm() -> Generator.Element {
        return Generator.Element.norm(Array(self))
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