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

public func sumAbsoluteValues<T: AccelerateFloatingPoint>(x: [T]) -> T {
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

public func meanMagnitude<T: AccelerateFloatingPoint>(x: [T]) -> T {
    return T.meamg(x)
}

public func meanSquare<T: AccelerateFloatingPoint>(x: [T]) -> T {
    return T.measq(x)
}

public func add<T: AccelerateFloatingPoint>(x: [T], y: [T]) -> [T] {
    return T.add(x, y: y)
}

public func subtract<T: AccelerateFloatingPoint>(x: [T], y: [T]) -> [T] {
    return T.sub(x, y: y)
}

public func multiply<T: AccelerateFloatingPoint>(x: [T], y: [T]) -> [T] {
    return T.mul(x, y: y)
}

public func divide<T: AccelerateFloatingPoint>(x: [T], y: [T]) -> [T] {
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

// MARK: - Arithmetic Array Extension

public extension Array where Element: AccelerateFloatingPoint {
    
    public func sum() -> Element {
        return Element.sum(self)
    }
    
    public func sumAbsoluteValues() -> Element {
        return Element.asum(self)
    }
    
    public func max() -> Element {
        return Element.max(self)
    }
    
    public func min() -> Element {
        return Element.min(self)
    }
    
    public func mean() -> Element {
        return Element.mean(self)
    }
    
    public func meanMagnitude() -> Element {
        return Element.meamg(self)
    }
    
    public func meanSquare() -> Element {
        return Element.measq(self)
    }
    
    public func plus(y: [Element]) -> [Element] {
        return Element.add(self, y: y)
    }
    
    public func minus(y: [Element]) -> [Element] {
        return Element.sub(self, y: y)
    }
    
    public func times(y: [Element]) -> [Element] {
        return Element.mul(self, y: y)
    }
    
    public func dividedBy(y: [Element]) -> [Element] {
        return Element.div(self, y: y)
    }
    
    public func mod(y: [Element]) -> [Element] {
        return Element.mod(self, y: y)
    }
    
    public func remainderWhenDividedBy(y: [Element]) -> [Element] {
        return Element.remainder(self, y: y)
    }

    public func sqrt() -> [Element] {
        return Element.sqrt(self)
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




