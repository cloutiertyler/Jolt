// Hyperbolic.swift
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

import Accelerate

public struct Matrix<T: AccelerateFloatingPoint> {
    public typealias Element = T

    public let rows: Int
    public let columns: Int
    public var grid: [Element]
    
    public init(rows: Int, columns: Int, contents: [Element]) {
        precondition(
            rows * columns == contents.count,
            "Rows and columns do not fit the shape of the contents."
        )
        self.rows = rows
        self.columns = columns
        self.grid = contents
    }

    public init(rows: Int, columns: Int, repeatedValue: Element) {
        self.init(
            rows: rows,
            columns: columns,
            contents: [Element](count: rows * columns, repeatedValue: repeatedValue)
        )
    }

    public init(_ contents: [[Element]]) {
        let isCorrectShape = !contents.contains { row -> Bool in
            return row.count != contents[0].count
        }
        precondition(isCorrectShape, "Rows are not the correct shape.")
        let m: Int = contents.count
        let n: Int = contents[0].count
        let repeatedValue: Element = 0.0

        self.init(rows: m, columns: n, repeatedValue: repeatedValue)

        for (i, row) in contents.enumerate() {
            grid.replaceRange(i*n..<i*n+min(m, row.count), with: row)
        }
    }

    public subscript(row: Int, column: Int) -> Element {
        get {
            assert(indexIsValidForRow(row, column: column))
            return grid[(row * columns) + column]
        }

        set {
            assert(indexIsValidForRow(row, column: column))
            grid[(row * columns) + column] = newValue
        }
    }

    private func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
}

// MARK: - Printable

extension Matrix: CustomStringConvertible {
    public var description: String {
        var description = ""

        for i in 0..<rows {
            let contents = (0..<columns).map{"\(self[i, $0])"}.joinWithSeparator("\t")

            switch (i, rows) {
            case (0, 1):
                description += "(\t\(contents)\t)"
            case (0, _):
                description += "⎛\t\(contents)\t⎞"
            case (rows - 1, _):
                description += "⎝\t\(contents)\t⎠"
            default:
                description += "⎜\t\(contents)\t⎥"
            }

            description += "\n"
        }

        return description
    }
}

// MARK: - SequenceType

extension Matrix: SequenceType {
    public func generate() -> AnyGenerator<ArraySlice<Element>> {
        let endIndex = rows * columns
        var nextRowStartIndex = 0

        return anyGenerator {
            if nextRowStartIndex == endIndex {
                return nil
            }

            let currentRowStartIndex = nextRowStartIndex
            nextRowStartIndex += self.columns

            return self.grid[currentRowStartIndex..<nextRowStartIndex]
        }
    }
}

// MARK: - Matrix Global Functions

public func add<T: AccelerateFloatingPoint>(x: Matrix<T>, y: Matrix<T>) -> Matrix<T> {
    return T.add(x, y: y)
}

public func add<T: AccelerateFloatingPoint>(x: Matrix<T>, alpha: T) -> Matrix<T> {
    return T.add(x, alpha: alpha)
}

public func sub<T: AccelerateFloatingPoint>(x: Matrix<T>, y: Matrix<T>) -> Matrix<T> {
    return T.sub(x, y: y)
}

public func sub<T: AccelerateFloatingPoint>(x: Matrix<T>, alpha: T) -> Matrix<T> {
    return T.sub(x, alpha: alpha)
}

public func multiply<T: AccelerateFloatingPoint>(x: Matrix<T>, y: Matrix<T>) -> Matrix<T> {
    return T.mul(x, y: y)
}

public func multiply<T: AccelerateFloatingPoint>(x: Matrix<T>, alpha: T) -> Matrix<T> {
    return T.mul(x, alpha: alpha)
}

public func divide<T: AccelerateFloatingPoint>(x: Matrix<T>, by y: Matrix<T>) -> Matrix<T> {
    return T.div(x, y: y)
}

public func divide<T: AccelerateFloatingPoint>(x: Matrix<T>, by alpha: T) -> Matrix<T> {
    return T.div(x, alpha: alpha)
}

public func invert<T: AccelerateFloatingPoint>(x: Matrix<T>) -> Matrix<T> {
    return T.inv(x)
}

public func transpose<T: AccelerateFloatingPoint>(x: Matrix<T>) -> Matrix<T> {
    return T.transpose(x)
}


// MARK: - Operators

public func +<T: AccelerateFloatingPoint> (lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T> {
    return T.add(lhs, y: rhs)
}

public func +<T: AccelerateFloatingPoint> (lhs: T, rhs: Matrix<T>) -> Matrix<T> {
    return T.add(rhs, alpha: lhs)
}

public func +<T: AccelerateFloatingPoint> (lhs: Matrix<T>, rhs: T) -> Matrix<T> {
    return T.add(lhs, alpha: rhs)
}

public func -<T: AccelerateFloatingPoint> (lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T> {
    return T.sub(lhs, y: rhs)
}

public func -<T: AccelerateFloatingPoint> (lhs: T, rhs: Matrix<T>) -> Matrix<T> {
    return T.sub(rhs, alpha: lhs)
}

public func -<T: AccelerateFloatingPoint> (lhs: Matrix<T>, rhs: T) -> Matrix<T> {
    return T.sub(lhs, alpha: rhs)
}

public func *<T: AccelerateFloatingPoint> (lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T> {
    return T.mul(lhs, y: rhs)
}

public func *<T: AccelerateFloatingPoint> (lhs: T, rhs: Matrix<T>) -> Matrix<T> {
    return T.mul(rhs, alpha: lhs)
}

public func *<T: AccelerateFloatingPoint> (lhs: Matrix<T>, rhs: T) -> Matrix<T> {
    return T.mul(lhs, alpha: rhs)
}

public func /<T: AccelerateFloatingPoint> (lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T> {
    return T.div(lhs, y: rhs)
}

public func /<T: AccelerateFloatingPoint> (lhs: T, rhs: Matrix<T>) -> Matrix<T> {
    return T.div(rhs, alpha: lhs)
}

public func /<T: AccelerateFloatingPoint> (lhs: Matrix<T>, rhs: T) -> Matrix<T> {
    return T.div(lhs, alpha: rhs)
}

postfix operator ′ {}
public postfix func ′<T: AccelerateFloatingPoint> (value: Matrix<T>) -> Matrix<T> {
    return transpose(value)
}