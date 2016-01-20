//
//  JoltTests.swift
//  JoltTests
//
//  Created by Tyler Fleming Cloutier on 1/19/16.
//  Copyright © 2016 Mattt Thompson. All rights reserved.
//

import XCTest
import Jolt

class ArithmeticTests: XCTestCase {
    
    let x = (0..<25_000).map{_ in Double(arc4random())}
    let n = 40_0000

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func measureBlockRepeated(num: Int, block: () -> ()) {
        self.measureBlock {
            for _ in 0..<num {
                block()
            }
        }
    }
    
    func testSumStaticFunctionPerformance() {
        self.measureBlock {
            for _ in 0..<self.n {
                sum(self.x)
            }
        }
    }
    
    func testSumProtocolExtensionPeformance() {
        self.measureBlock {
            for _ in 0..<self.n {
                self.x.sum()
            }
        }
    }
    
    func testSumNativeSwiftPerformance() {
        self.measureBlock {
            for _ in 0..<self.n {
                _ = self.x.reduce(0, combine: +)
            }
        }
    }
}
