// Auxilliary.swift
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

// MARK: - Auxillary Global Functions

public func abs<T: AccelerateFloatingPoint>(x: [T]) -> [T] {
    return T.abs(x)
}

public func floor<T: AccelerateFloatingPoint>(x: [T]) -> [T] {
    return T.floor(x)
}

public func ceil<T: AccelerateFloatingPoint>(x: [T]) -> [T] {
    return T.ceil(x)
}

public func neg<T: AccelerateFloatingPoint>(x: [T]) -> [T] {
    return T.neg(x)
}

public func clip<T: AccelerateFloatingPoint>(x: [T], low: T, high: T) -> [T] {
    return T.clip(x, low: low, high: high)
}

public func copysign<T: AccelerateFloatingPoint>(magnitude: [T], sign: [T]) -> [T] {
    return T.copysign(magnitude, sign: sign)
}

public func rec<T: AccelerateFloatingPoint>(x: [T]) -> [T] {
    return T.rec(x)
}

public func round<T: AccelerateFloatingPoint>(x: [T]) -> [T] {
    return T.round(x)
}

public func threshold<T: AccelerateFloatingPoint>(x: [T], low: T) -> [T] {
    return T.threshold(x, low: low)
}

public func trunc<T: AccelerateFloatingPoint>(x: [T]) -> [T] {
    return T.trunc(x)
}

// MARK: - Auxilliary CollectionType Extension

public extension CollectionType where Generator.Element: AccelerateFloatingPoint {

    public func absoluted() -> [Generator.Element] {
        return Generator.Element.abs(Array(self))
    }
    
    public func floored() -> [Generator.Element] {
        return Generator.Element.floor(Array(self))
    }
    
    public func ceiled() -> [Generator.Element] {
        return Generator.Element.ceil(Array(self))
    }
    
    public func negated() -> [Generator.Element] {
        return Generator.Element.neg(Array(self))
    }
    
    public func clipped(low: Generator.Element, high: Generator.Element) -> [Generator.Element] {
        return Generator.Element.clip(Array(self), low: low, high: high)
    }
    
    public func copysigned(sign: [Generator.Element]) -> [Generator.Element] {
        return Generator.Element.copysign(Array(self), sign: sign)
    }
    
    public func reciprocated() -> [Generator.Element] {
        return Generator.Element.rec(Array(self))
    }
    
    public func rounded() -> [Generator.Element] {
        return Generator.Element.round(Array(self))
    }
    
    public func thresholded(low: Generator.Element) -> [Generator.Element] {
        return Generator.Element.threshold(Array(self), low: low)
    }
    
    public func truncated() -> [Generator.Element] {
        return Generator.Element.trunc(Array(self))
    }
    
}

// MARK - Operators

prefix operator - {}

public prefix func -<T: AccelerateFloatingPoint>(value: [T]) -> [T] {
    return T.neg(value)
}