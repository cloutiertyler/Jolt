//
//  Blah.swift
//  Jolt
//
//  Created by Tyler Fleming Cloutier on 1/19/16.
//  Copyright © 2016 Mattt Thompson. All rights reserved.
//

import XCTest
import Jolt

class Blah: XCTestCase {

    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        let n = [-1.0, 2.0, 3.0, 4.0, 5.0]

        self.measureBlock {
            for i in 0..<10000 {
                let sum = n.sum()
            }
        }
        
        self.measureBlock {
            for i in 0..<10000 {
                let sum = Double.sum(n)
            }
        }
    }

}
