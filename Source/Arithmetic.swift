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

// MARK: - Arithmetic

// MARK: - Operators

public func +<T: AccelerateFloatingPoint>(lhs: [T], rhs: [T]) -> [T] {
    return T.add(lhs, y: rhs)
}

public func +<T: AccelerateFloatingPoint>(lhs: [T], rhs: T) -> [T] {
    return T.add(lhs, y: [T](count: lhs.count, repeatedValue: rhs))
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




