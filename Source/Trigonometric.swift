// Trigonometric.swift
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


// MARK: - Trigonometric Global Functions

public func sincos<T: AccelerateFloatingPoint>(x: [T]) -> (sin: [T], cos: [T]) {
    return T.sincos(x)
}

public func sin<T: AccelerateFloatingPoint>(x: [T]) -> [T] {
    return T.sin(x)
}

public func cos<T: AccelerateFloatingPoint>(x: [T]) -> [T] {
    return T.cos(x)
}

public func tan<T: AccelerateFloatingPoint>(x: [T]) -> [T] {
    return T.tan(x)
}

public func asin<T: AccelerateFloatingPoint>(x: [T]) -> [T] {
    return T.asin(x)
}

public func acos<T: AccelerateFloatingPoint>(x: [T]) -> [T] {
    return T.acos(x)
}

public func atan<T: AccelerateFloatingPoint>(x: [T]) -> [T] {
    return T.atan(x)
}

// MARK: - Trigonometric Array Extension
// There are intentionally no methods for trigonometric functions.
// Such functions are more clearly expressed as mathematical functions

public extension Array where Element: AccelerateFloatingPoint {
    
}