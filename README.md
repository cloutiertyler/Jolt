# Jolt
*Swift + Accelerate + A shameless fork from Surge*

[Accelerate](https://developer.apple.com/library/mac/documentation/Accelerate/Reference/AccelerateFWRef/_index.html) is a framework that provides high-performance functions for matrix math, digital signal processing, and image manipulation. It harnesses [SIMD](http://en.wikipedia.org/wiki/SIMD) instructions available in modern CPUs to significantly improve performance of certain calculations.

Because of its relative obscurity and inconvenient APIs, Accelerate is not commonly used by developers... which is a shame, since many applications could benefit from these performance optimizations.

**Jolt aims to bring Accelerate to the mainstream, making it as easy (and nearly as fast, in most cases) to perform computation over a set of numbers as for a single member.**

Though, keep in mind: _Accelerate is not a silver bullet_. Under certain conditions, such as performing simple calculations over a small data set, Accelerate can be out-performed by conventional algorithms. Always benchmark to determine the performance characteristics of each potential approach.

---

> Curious about the name _Jolt_? 
Back in the mid 90's, Apple, IBM, and Motorola teamed up to create [AltiVec](http://en.wikipedia.org/wiki/AltiVec) (a.k.a the Velocity Engine), which provided a SIMD instruction set for the PowerPC architecture. When Apple made the switch to Intel CPUs, AltiVec was ported to the x86 architecture and rechristened [Accelerate](https://developer.apple.com/library/mac/documentation/Accelerate/Reference/AccelerateFWRef/_index.html). The derivative of Accelerate (and second derivative of Velocity) is known as either [jerk, jolt, surge, or lurch](http://en.wikipedia.org/wiki/Jerk_%28physics%29), hence the name of this library.
Jolt is a synonym for Surge, the project Jolt is derived from! 

> If it's a derivative of Surge, why didn't I call it Jounce or Snap?
Well because those are silly.


---

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
sum = numbers.summed()
```

_(Time in milliseconds, Optimization Level `-Ofast`)_

|    _n_     |   Swift          |   Surge       |   Δ       |
|------------|------------------|---------------|-----------|
| 100        | 0.269081         | 0.004453      | ~60x      |
| 100000     | 251.037254       | 0.028687      | ~9000x    |
| 100000000  | 239474.689326    | 57.009841     | ~4000x    |

> Jolt's performance characteristics have not yet been thoroughly evaluated, though initial benchmarks show incredible promise. Further investigation is definitely warranted.

## Installation

_The infrastructure and best practices for distributing Swift libraries are currently in flux during this beta period of Swift & Xcode. In the meantime, you can add Jolt as a git submodule, drag the `Jolt.xcodeproj` file into your Xcode project, and add `Jolt.framework` as a dependency for your target._

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
let sum = n.summed() // 15.0
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
