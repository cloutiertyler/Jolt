//
//  AccelerateFloatingPoint.swift
//  Surge
//
//  Created by Tyler Fleming Cloutier on 1/18/16.
//  Copyright © 2016 Mattt Thompson. All rights reserved.
//

import Foundation

public protocol AccelerateFloatingPoint: FloatingPointType, FloatLiteralConvertible {
    
    // Operators that Float and Double already implement.
    
    prefix func -(x: Self) -> Self
    
    func -(lhs: Self, rhs: Self) -> Self
    
    func +(lhs: Self, rhs: Self) -> Self
    
    func *(lhs: Self, rhs: Self) -> Self
    
    func /(lhs: Self, rhs: Self) -> Self
    
    func %(lhs: Self, rhs: Self) -> Self
    
    
    func +=(inout lhs: Self, rhs: Self)
    
    func -=(inout lhs: Self, rhs: Self)
    
    func *=(inout lhs: Self, rhs: Self)
    
    func /=(inout lhs: Self, rhs: Self)
    
    func %=(inout lhs: Self, rhs: Self)
    
    // MARK: Arithmetic
    
    static func sum(x: [Self]) -> Self
    
    static func asum(x: [Self]) -> Self
    
    static func max(x: [Self]) -> Self
    
    static func min(x: [Self]) -> Self
    
    static func mean(x: [Self]) -> Self
    
    static func meamg(x: [Self]) -> Self
    
    static func measq(x: [Self]) -> Self
    
    static func add(x: [Self], y: [Self]) -> [Self]
    
    static func sub(x: [Self], y: [Self]) -> [Self]
    
    static func mul(x: [Self], y: [Self]) -> [Self]
    
    static func div(x: [Self], y: [Self]) -> [Self]
    
    static func mod(x: [Self], y: [Self]) -> [Self]
    
    static func remainder(x: [Self], y: [Self]) -> [Self]
    
    static func sqrt(x: [Self]) -> [Self]
    
    
    // MARK: Vector
    
    static func dot(x: [Self], y: [Self]) -> Self
    
    static func cross(x: [Self], y: [Self]) -> [Self]
    
    static func length(x: [Self]) -> Self
    
    static func norm(x: [Self]) -> Self
    
    
    // MARK: Power
    
    static func pow(x: [Self], y: [Self]) -> [Self]
    
    
    // MARK: Auxiliary
    
    static func abs(x: [Self]) -> [Self]

    static func ceil(x: [Self]) -> [Self]
    
    static func clip(x: [Self], low: Self, high: Self) -> [Self]

    static func copysign(magnitude: [Self], sign: [Self]) -> [Self]
    
    static func floor(x: [Self]) -> [Self]
    
    static func neg(x: [Self]) -> [Self]
    
    static func rec(x: [Self]) -> [Self]
    
    static func round(x: [Self]) -> [Self]
    
    static func threshold(x: [Self], low: Self) -> [Self]
    
    static func trunc(x: [Self]) -> [Self]
    
    
    // MARK: Exponentiation
    
    static func exp(x: [Self]) -> [Self]
    
//    static func exp(inout x: [Self])

    static func exp2(x: [Self]) -> [Self]

    static func log(x: [Self]) -> [Self]
    
    static func log2(x: [Self]) -> [Self]
    
    static func log10(x: [Self]) -> [Self]
    
    static func logb(x: [Self]) -> [Self]
    
    
    // MARK: Fast Fourier Transform
    
    static func fft(input: [Self]) -> [Self]
    
    
    // MARK: Trigonometrics

    static func sincos(x: [Self]) -> (sin: [Self], cos: [Self])
    
    static func sin(x: [Self]) -> [Self]

    static func cos(x: [Self]) -> [Self]
    
    static func tan(x: [Self]) -> [Self]
    
    static func asin(x: [Self]) -> [Self]

    static func acos(x: [Self]) -> [Self]

    static func atan(x: [Self]) -> [Self]

    
    // MARK: Hyperbolics
    
    static func sinh(x: [Self]) -> [Self]
    
    static func cosh(x: [Self]) -> [Self]
    
    static func tanh(x: [Self]) -> [Self]
    
    static func asinh(x: [Self]) -> [Self]
    
    static func acosh(x: [Self]) -> [Self]
    
    static func atanh(x: [Self]) -> [Self]
    
    
    // MARK: Conversions
    
    static func rad2deg(x: [Self]) -> [Self]
    
    static func deg2rad(x: [Self]) -> [Self]
    
    // MARK: - Matrix Operations
    
    static func add(x: Matrix<Self>, y: Matrix<Self>) -> Matrix<Self>
    
    static func add(x: Matrix<Self>, alpha: Self) -> Matrix<Self>
    
    static func sub(x: Matrix<Self>, y: Matrix<Self>) -> Matrix<Self>
    
    static func sub(x: Matrix<Self>, alpha: Self) -> Matrix<Self>
    
    static func mul(x: Matrix<Self>, y: Matrix<Self>) -> Matrix<Self>
    
    static func mul(x: Matrix<Self>, alpha: Self) -> Matrix<Self>

    static func div(x: Matrix<Self>, y: Matrix<Self>) -> Matrix<Self>
    
    static func div(x: Matrix<Self>, alpha: Self) -> Matrix<Self>

    static func inv(x: Matrix<Self>) -> Matrix<Self>
    
    static func transpose(x: Matrix<Self>) -> Matrix<Self>

}