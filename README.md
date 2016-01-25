# Jolt
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

*Swift + Accelerate + Heavy inspiration from Surge*

Jolt is a project which was originally a fork of [Surge](https://github.com/mattt/Surge). It has since been spun off into it's own project due significant API differences. Surge was originally developed during the Swift 1 timeframe, yet Swift has evolved and is continuing to evolve. Therefore, the motivation Jolt was to bring Surge up to date with new Swift features and API Guidelines. Swift's new [API Guidelines](https://swift.org/documentation/api-design-guidelines/) are available at [swift.org](https://www.swift.org).

####Other notable differences

- Jolt is built for both OSX and iOS platforms. 
- Jolt can be easily installed with [Carthage](https://github.com/Carthage/Carthage).
- It is possible to create custom generic types that utilize Jolt functions.
```
struct Plane<T: AccelerateFloatingPoint> {
   let normal: [T]
   let distance: T
   
   init(normal: [T], point: [T]) {
       self.normal = T.normalize(normal)
       self.distance = T.dot(normal, y: point)
   }
   
   init(p1: [T], p2: [T], p3: [T]){
       self.normal = T.normalize(T.cross((p2 + -p1), y: (p3 + -p1)))
       self.distance = -(T.dot(normal, y: p1))
   }
}
```

Thank you to Mattt Thompson for the excellent idea of surfacing the Accelerate Framework API and making them Swifty!

---

[Accelerate](https://developer.apple.com/library/mac/documentation/Accelerate/Reference/AccelerateFWRef/_index.html) is a framework that provides high-performance functions for matrix math, digital signal processing, and image manipulation. It harnesses [SIMD](http://en.wikipedia.org/wiki/SIMD) instructions available in modern CPUs to significantly improve performance of certain calculations.

Because of its relative obscurity and inconvenient APIs, Accelerate is not commonly used by developers... which is a shame, since many applications could benefit from these performance optimizations.

**Jolt aims to bring Accelerate to the mainstream, making it as easy (and nearly as fast, in most cases) to perform computation over a set of numbers as for a single member.**

> Curious about the name _Jolt_? 
The name Jolt is derived from the fact that this project is forked from Surge. 
Back in the mid 90's, Apple, IBM, and Motorola teamed up to create [AltiVec](http://en.wikipedia.org/wiki/AltiVec) (a.k.a the Velocity Engine), which provided a SIMD instruction set for the PowerPC architecture. When Apple made the switch to Intel CPUs, AltiVec was ported to the x86 architecture and rechristened [Accelerate](https://developer.apple.com/library/mac/documentation/Accelerate/Reference/AccelerateFWRef/_index.html). The derivative of Accelerate (and second derivative of Velocity) is known as either [jerk, jolt, surge, or lurch](http://en.wikipedia.org/wiki/Jerk_%28physics%29), hence the name of this library.
> If it's a derivative of Surge, why didn't I call it Jounce or Snap?
Well because those are silly.

Disclaimer: **_Accelerate is not a silver bullet_**. Under certain conditions, such as performing simple calculations over a small data set, Accelerate can be out-performed by conventional algorithms. Always benchmark to determine the performance characteristics of each potential approach.


## Performance

Initial benchmarks on iOS devices and the iOS simulator indicate significant performance improvements over a conventional Swift implementation.

```swift
import Jolt

let numbers: [Double] = ...
var sum: Double = 0.0

// Naïve Swift Implementation
sum = reduce(numbers, 0.0, +)

// Jolt Implementations
sum = Jolt.sum(numbers)
sum = numbers.sum()
```

_(Time in milliseconds, Optimization Level `Fast, Whole Module Optimization`)_

| Operation |     _n_     |   Swift    |   Surge    |     Δ     |
|-----------|-------------|------------|------------|-----------|
|    sum    | 100,000,000 | 0.055      | 0.112      | ~0.5x     |
|    sin    | 100,000,000 | 7.803      | 1.946      | ~4x       |
|    exp    | 100,000,000 | 6.406      | 1.427      | ~4.5x     |

> Jolt's performance characteristics have not yet been thoroughly evaluated, though initial benchmarks show some promise. If anything, a comparison with the original benchmarks from Surge demonstrate just how far the Swift optimizer has come.

## Installation

Jolt is Carthage compatible. To install add the following to you Cartfile.
```
github "TheArtOfEngineering/Jolt" 
```
For additional info on Carthage installation please visit [https://github.com/Carthage/Carthage](https://github.com/Carthage/Carthage).

---

## Inventory

> Jolt functions are named according to their corresponding "Math.h" functions, where applicable (omitting `f` and `d` affixes, since type information is communicated and enforced by the language's type system).

### Arithmetic

- `sum`
- `asum`
- `max`
- `min`
- `mean`
- `meamg`
- `measq`
- `add`
- `mul`
- `div`
- `mod`
- `remainder`
- `sqrt`

### Auxilliary

- `abs`
- `ceil`
- `copysign`
- `floor`
- `rec`
- `round`
- `trunc`

### Exponential

- `exp`
- `exp2`
- `log`
- `log2`
- `log10`
- `logb`

### FFT

- `fft`

### Hyperbolic

- `sinh`
- `cosh`
- `tanh`
- `asinh`
- `acosh`
- `atanh`

### Matrix

- `add`
- `mul`
- `inv`
- `transpose`

### Power

- `pow`

### Trigonometric

- `sincos`
- `sin`
- `cos`
- `tan`
- `asin`
- `acos`
- `atan`
- `rad2deg`
- `deg2rad`

## Usage

### Computing Sum of `[Double]`

```swift
import Jolt

let n = [1.0, 2.0, 3.0, 4.0, 5.0]
let sum = n.sum() // 15.0
```

### Computing Product of Two `[Double]`s

```swift
import Jolt

let a = [1.0, 3.0, 5.0, 7.0]
let b = [2.0, 4.0, 6.0, 8.0]

let product = a * b // [2.0, 12.0, 30.0, 56.0]
```

---

## License

Jolt is available under the MIT license. See the LICENSE file for more info.
