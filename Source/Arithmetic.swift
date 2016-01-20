// Arithmetic.swift
//
// Copyright (c) 2014–2015 Mattt Thompson (http://mattt.me)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

// MARK: - Arithmetic Global Functions

public func sum<T: AccelerateFloatingPoint>(x: [T]) -> T {
    return T.sum(x)
}

public func asum<T: AccelerateFloatingPoint>(x: [T]) -> T {
    return T.asum(x)
}

public func max<T: AccelerateFloatingPoint>(x: [T]) -> T {
    return T.max(x)
}

public func min<T: AccelerateFloatingPoint>(x: [T]) -> T {
    return T.min(x)
}

public func mean<T: AccelerateFloatingPoint>(x: [T]) -> T {
    return T.mean(x)
}

public func meamg<T: AccelerateFloatingPoint>(x: [T]) -> T {
    return T.meamg(x)
}

public func measq<T: AccelerateFloatingPoint>(x: [T]) -> T {
    return T.measq(x)
}

public func add<T: AccelerateFloatingPoint>(x: [T], y: [T]) -> [T] {
    return T.add(x, y: y)
}

public func sub<T: AccelerateFloatingPoint>(x: [T], y: [T]) -> [T] {
    return T.sub(x, y: y)
}

public func mul<T: AccelerateFloatingPoint>(x: [T], y: [T]) -> [T] {
    return T.mul(x, y: y)
}

public func div<T: AccelerateFloatingPoint>(x: [T], y: [T]) -> [T] {
    return T.div(x, y: y)
}

public func mod<T: AccelerateFloatingPoint>(x: [T], y: [T]) -> [T] {
    return T.mod(x, y: y)
}

public func remainder<T: AccelerateFloatingPoint>(x: [T], y: [T]) -> [T] {
    return T.remainder(x, y: y)
}

public func sqrt<T: AccelerateFloatingPoint>(x: [T]) -> [T] {
    return T.sqrt(x)
}

// MARK: - Arithmetic CollectionType Extension

public extension CollectionType where Generator.Element: AccelerateFloatingPoint {
    
    public func sum() -> Generator.Element {
        return Generator.Element.sum(Array(self))
    }
    
    public func asum() -> Generator.Element {
        return Generator.Element.asum(Array(self))
    }
    
    public func max() -> Generator.Element {
        return Generator.Element.max(Array(self))
    }
    
    public func min() -> Generator.Element {
        return Generator.Element.min(Array(self))
    }
    
    public func mean() -> Generator.Element {
        return Generator.Element.mean(Array(self))
    }
    
    public func meamg() -> Generator.Element {
        return Generator.Element.meamg(Array(self))
    }
    
    public func measq() -> Generator.Element {
        return Generator.Element.measq(Array(self))
    }
    
    public func adding(y: [Generator.Element]) -> [Generator.Element] {
        return Generator.Element.add(Array(self), y: y)
    }
    
    public func subtracting(y: [Generator.Element]) -> [Generator.Element] {
        return Generator.Element.sub(Array(self), y: y)
    }
    
    public func multiplying(y: [Generator.Element]) -> [Generator.Element] {
        return Generator.Element.mul(Array(self), y: y)
    }
    
    public func dividing(y: [Generator.Element]) -> [Generator.Element] {
        return Generator.Element.div(Array(self), y: y)
    }
    
    // TODO: Conform this to API Design Guildines on swift.org
    public func mod(y: [Generator.Element]) -> [Generator.Element] {
        return Generator.Element.mod(Array(self), y: y)
    }
    
    // TODO: Conform this to API Design Guildines on swift.org
    public func remainder(y: [Generator.Element]) -> [Generator.Element] {
        return Generator.Element.remainder(Array(self), y: y)
    }

    public func sqrt() -> [Generator.Element] {
        return Generator.Element.sqrt(Array(self))
    }
    
}

// MARK: - Operators

public func +<T: AccelerateFloatingPoint>(lhs: [T], rhs: [T]) -> [T] {
    return T.add(lhs, y: rhs)
}

public func +<T: AccelerateFloatingPoint>(lhs: [T], rhs: T) -> [T] {
    return T.add(lhs, y: [T](count: lhs.count, repeatedValue: rhs))
}

public func -<T: AccelerateFloatingPoint>(lhs: [T], rhs: [T]) -> [T] {
    return T.sub(lhs, y: rhs)
}

public func -<T: AccelerateFloatingPoint>(lhs: [T], rhs: T) -> [T] {
    return T.sub(lhs, y: [T](count: lhs.count, repeatedValue: rhs))
}

public func /<T: AccelerateFloatingPoint>(lhs: [T], rhs: [T]) -> [T] {
    return T.div(lhs, y: rhs)
}

public func /<T: AccelerateFloatingPoint>(lhs: [T], rhs: T) -> [T] {
    return T.div(lhs, y: [T](count: lhs.count, repeatedValue: rhs))
}

public func *<T: AccelerateFloatingPoint>(lhs: [T], rhs: [T]) -> [T] {
    return T.mul(lhs, y: rhs)
}

public func *<T: AccelerateFloatingPoint>(lhs: [T], rhs: T) -> [T] {
    return T.mul(lhs, y: [T](count: lhs.count, repeatedValue: rhs))
}

public func %<T: AccelerateFloatingPoint>(lhs: [T], rhs: [T]) -> [T] {
    return T.mod(lhs, y: rhs)
}

public func %<T: AccelerateFloatingPoint>(lhs: [T], rhs: T) -> [T] {
    return T.mod(lhs, y: [T](count: lhs.count, repeatedValue: rhs))
}




