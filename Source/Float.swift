//
//  Float.swift
//  Surge
//
//  Created by Tyler Fleming Cloutier on 1/18/16.
//  Copyright © 2016 Mattt Thompson. All rights reserved.
//

import Foundation
import Accelerate

// MARK: - Single Precision

extension Float: AccelerateFloatingPoint {
    
    // MARK: Sum
    
    public static func sum(x: [Float]) -> Float {
        var result: Float = 0.0
        vDSP_sve(x, 1, &result, vDSP_Length(x.count))
        
        return result
    }
    
    // MARK: Sum of Absolute Values
    
    public static func asum(x: [Float]) -> Float {
        return cblas_sasum(Int32(x.count), x, 1)
    }
    
    // MARK: Maximum
    
    public static func max(x: [Float]) -> Float {
        var result: Float = 0.0
        vDSP_maxv(x, 1, &result, vDSP_Length(x.count))
        
        return result
    }
    
    // MARK: Minimum
    
    public static func min(x: [Float]) -> Float {
        return cblas_sasum(Int32(x.count), x, 1)
    }
    
    // MARK: Mean
    
    public static func mean(x: [Float]) -> Float {
        var result: Float = 0.0
        vDSP_meanv(x, 1, &result, vDSP_Length(x.count))
        
        return result
    }
    
    // MARK: Mean Magnitude
    
    public static func meamg(x: [Float]) -> Float {
        var result: Float = 0.0
        vDSP_meamgv(x, 1, &result, vDSP_Length(x.count))
        
        return result    }
    
    // MARK: Mean Square Value
    
    public static func measq(x: [Float]) -> Float {
        var result: Float = 0.0
        vDSP_measqv(x, 1, &result, vDSP_Length(x.count))
        
        return result
    }
    
    // MARK: Add
    
    public static func add(x: [Float], y: [Float]) -> [Float] {
        var results = [Float](y)
        cblas_saxpy(Int32(x.count), 1.0, x, 1, &results, 1)
        
        return results
    }
    
    // MARK: Sub
    
    public static func sub(x: [Float], y: [Float]) -> [Float] {
        var results = [Float](x)
        cblas_saxpy(Int32(y.count), -1.0, y, 1, &results, 1)
        
        return results
    }
    
    // MARK: Multiply
    
    public static func mul(x: [Float], y: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vDSP_vmul(x, 1, y, 1, &results, 1, vDSP_Length(x.count))
        
        return results
    }
    
    // MARK: Divide
    
    public static func div(x: [Float], y: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvdivf(&results, x, y, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Modulo
    
    public static func mod(x: [Float], y: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvfmodf(&results, x, y, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Remainder
    
    public static func remainder(x: [Float], y: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvremainderf(&results, x, y, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Square Root
    
    public static func sqrt(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvsqrtf(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Dot Product
    
    public static func dot(x: [Float], y: [Float]) -> Float {
        precondition(x.count == y.count, "Vectors must have equal count")
        
        var result: Float = 0.0
        vDSP_dotpr(x, 1, y, 1, &result, vDSP_Length(x.count))
        
        return result
    }
    
    // MARK: Cross Product
    
    public static func cross(x: [Float], y: [Float]) -> [Float] {
        precondition(x.count == 3 && y.count == 3, "Cross product vectors must have count 3")
        let m: Matrix<Float> = Matrix(
            [
                [0, -x[2], x[1]],
                [x[2], 0, -x[0]],
                [-x[1], x[0], 0]
            ]
        )
        return (m * Matrix([y])′).grid
    }
    
    // MARK: Vector Norm (These are the same)
    
    public static func norm(x: [Float]) -> Float {
        return cblas_snrm2(Int32(x.count), x, 1)
    }
    
    public static func length(x: [Float]) -> Float {
        return cblas_snrm2(Int32(x.count), x, 1)
        
    }
    
    // MARK: Power
    
    public static func pow(x: [Float], y: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvpowf(&results, x, y, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Absolute Value
    
    public static func abs(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvfabsf(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Ceiling
    
    public static func ceil(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvceilf(&results, x, [Int32(x.count)])
        
        return results
    }

    // MARK: Clip
    
    public static func clip(x: [Float], low: Float, high: Float) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0), y = low, z = high
        vDSP_vclip(x, 1, &y, &z, &results, 1, vDSP_Length(x.count))
        
        return results
    }
    
    // MARK: Copy Sign
    
    public static func copysign(magnitude: [Float], sign: [Float]) -> [Float] {
        var results = [Float](count: sign.count, repeatedValue: 0.0)
        vvcopysignf(&results, magnitude, sign, [Int32(sign.count)])
        
        return results
    }
    
    // MARK: Floor
    
    public static func floor(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvfloorf(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Negate
    
    public static func neg(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vDSP_vneg(x, 1, &results, 1, vDSP_Length(x.count))
        
        return results
    }
    
    // MARK: Reciprocal
    
    public static func rec(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvrecf(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Round
    
    public static func round(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvnintf(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Threshold
    
    public static func threshold(x: [Float], low: Float) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0), y = low
        vDSP_vthr(x, 1, &y, &results, 1, vDSP_Length(x.count))
        
        return results
    }
    
    // MARK: Truncate
    
    public static func trunc(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvintf(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Exponentiation
    
    public static func exp(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvexpf(&results, x, [Int32(x.count)])
        
        return results
    }
    
//    public static func exp(inout x: [Float]) {
//        vvexpf(&x, x, [Int32(x.count)])
//    }
    
    // MARK: Square Exponentiation
    
    public static func exp2(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvexp2f(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Natural Logarithm
    
    public static func log(x: [Float]) -> [Float] {
        var results = [Float](x)
        vvlogf(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Base-2 Logarithm
    
    public static func log2(x: [Float]) -> [Float] {
        var results = [Float](x)
        vvlog2f(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Base-10 Logarithm
    
    public static func log10(x: [Float]) -> [Float] {
        var results = [Float](x)
        vvlog10f(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Logarithmic Exponentiation
    
    public static func logb(x: [Float]) -> [Float] {
        var results = [Float](x)
        vvlogbf(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Fast Fourier Transform
    
    public static func fft(input: [Float]) -> [Float] {
        var real = [Float](input)
        var imaginary = [Float](count: input.count, repeatedValue: 0.0)
        var splitComplex = DSPSplitComplex(realp: &real, imagp: &imaginary)
        
        let length = vDSP_Length(Darwin.floor(Darwin.log2(Float(input.count))))
        let radix = FFTRadix(kFFTRadix2)
        let weights = vDSP_create_fftsetup(length, radix)
        vDSP_fft_zip(weights, &splitComplex, 1, length, FFTDirection(FFT_FORWARD))
        
        var magnitudes = [Float](count: input.count, repeatedValue: 0.0)
        vDSP_zvmags(&splitComplex, 1, &magnitudes, 1, vDSP_Length(input.count))
        
        var normalizedMagnitudes = [Float](count: input.count, repeatedValue: 0.0)
        vDSP_vsmul(sqrt(magnitudes), 1, [2.0 / Float(input.count)], &normalizedMagnitudes, 1, vDSP_Length(input.count))
        
        vDSP_destroy_fftsetup(weights)
        
        return normalizedMagnitudes
    }
    
    
    // MARK: Hyperbolic Sine
    
    public static func sinh(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvsinhf(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Hyperbolic Cosine
    
    public static func cosh(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvcoshf(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Hyperbolic Tangent
    
    public static func tanh(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvtanhf(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Inverse Hyperbolic Sine
    
    public static func asinh(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvasinhf(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Inverse Hyperbolic Cosine
    
    public static func acosh(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvacoshf(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Inverse Hyperbolic Tangent
    
    public static func atanh(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvatanhf(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Sine-Cosine
    
    public static func sincos(x: [Float]) -> (sin: [Float], cos: [Float]) {
        var sin = [Float](count: x.count, repeatedValue: 0.0)
        var cos = [Float](count: x.count, repeatedValue: 0.0)
        vvsincosf(&sin, &cos, x, [Int32(x.count)])
        
        return (sin, cos)
    }
    
    // MARK: Sine
    
    public static func sin(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvsinf(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Cosine
    
    public static func cos(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvcosf(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Tangent
    
    public static func tan(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvtanf(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Arcsine
    
    public static func asin(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvasinf(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Arccosine
    
    public static func acos(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvacosf(&results, x, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Arctangent
    
    public static func atan(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        vvatanf(&results, x, [Int32(x.count)])
        
        return results
    }
    
    
    // MARK: Radians to Degrees
    
    public static func rad2deg(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        let divisor = [Float](count: x.count, repeatedValue: Float(M_PI / 180.0))
        vvdivf(&results, x, divisor, [Int32(x.count)])
        
        return results
    }
    
    // MARK: Degrees to Radians
    
    public static func deg2rad(x: [Float]) -> [Float] {
        var results = [Float](count: x.count, repeatedValue: 0.0)
        let divisor = [Float](count: x.count, repeatedValue: Float(180.0 / M_PI))
        vvdivf(&results, x, divisor, [Int32(x.count)])
        
        return results
    }
    
    // MARK: - Matrix Operations
    
    public static func add(x: Matrix<Float>, y: Matrix<Float>) -> Matrix<Float> {
        precondition(x.rows == y.rows && x.columns == y.columns, "Matrix dimensions not compatible with addition")
        
        var results = y
        cblas_saxpy(Int32(x.grid.count), 1.0, x.grid, 1, &(results.grid), 1)
        
        return results
    }
    
    public static func add(x: Matrix<Float>, alpha: Float) -> Matrix<Float> {
        
        var results = x
        results.grid = [Float](count: results.grid.count, repeatedValue: alpha)
        cblas_saxpy(Int32(x.grid.count), 1.0, x.grid, 1, &(results.grid), 1)
        
        return results
    }
    
    public static func sub(x: Matrix<Float>, y: Matrix<Float>) -> Matrix<Float> {
        
        var results = y
        cblas_saxpy(Int32(x.grid.count), -1.0, x.grid, 1, &(results.grid), 1)
        
        return results
    }
    
    public static func sub(x: Matrix<Float>, alpha: Float) -> Matrix<Float> {
        
        var results = x
        results.grid = [Float](count: results.grid.count, repeatedValue: alpha)
        cblas_saxpy(Int32(x.grid.count), -1.0, x.grid, 1, &(results.grid), 1)
        
        return results
    }
    
    public static func mul(x: Matrix<Float>, y: Matrix<Float>) -> Matrix<Float> {
        precondition(x.columns == y.rows, "Matrix dimensions not compatible with multiplication")
        
        var results = Matrix<Float>(rows: x.rows, columns: y.columns, repeatedValue: 0.0)
        cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, Int32(x.rows), Int32(y.columns), Int32(x.columns), 1.0, x.grid, Int32(x.columns), y.grid, Int32(y.columns), 0.0, &(results.grid), Int32(results.columns))
        
        return results
    }
    
    public static func mul(x: Matrix<Float>, alpha: Float) -> Matrix<Float> {
        var results = x
        cblas_sscal(Int32(x.grid.count), alpha, &(results.grid), 1)
        
        return results
    }
    
    public static func div(x: Matrix<Float>, y: Matrix<Float>) -> Matrix<Float> {
        let yInv = y′
        precondition(x.columns == yInv.rows, "Matrix dimensions not compatible")
        return Float.mul(x, y: yInv)
    }
    
    public static func div(x: Matrix<Float>, alpha: Float) -> Matrix<Float> {
        var results = x
        let y = [Float](count: x.grid.count, repeatedValue: alpha)
        vvdivf(&results.grid, x.grid, y, [Int32(x.grid.count)])
        
        return results
    }
    
    public static func inv(x : Matrix<Float>) -> Matrix<Float> {
        precondition(x.rows == x.columns, "Matrix must be square")
        
        var results = x
        
        var ipiv = [__CLPK_integer](count: x.rows * x.rows, repeatedValue: 0)
        var lwork = __CLPK_integer(x.columns * x.columns)
        var work = [CFloat](count: Int(lwork), repeatedValue: 0.0)
        var error: __CLPK_integer = 0
        var nc = __CLPK_integer(x.columns)
        
        sgetrf_(&nc, &nc, &(results.grid), &nc, &ipiv, &error)
        sgetri_(&nc, &(results.grid), &nc, &ipiv, &work, &lwork, &error)
        
        assert(error == 0, "Matrix not invertible")
        
        return results
    }
    
    public static func transpose(x: Matrix<Float>) -> Matrix<Float> {
        var results = Matrix<Float>(rows: x.columns, columns: x.rows, repeatedValue: 0.0)
        vDSP_mtrans(x.grid, 1, &(results.grid), 1, vDSP_Length(results.rows), vDSP_Length(results.columns))
        
        return results
    }
    
}


