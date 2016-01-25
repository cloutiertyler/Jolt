//: Playground - noun: a place where people can play

import Jolt

let numbers: [Double] = [1.4, 2.6, 3.0, 5.5, 6.5]
var sum: Double = 0.0

// Naïve Swift Implementation
sum = numbers.reduce(0.0, combine: +)

// Jolt Implementations
sum = Jolt.sum(numbers)
sum = numbers.sum()