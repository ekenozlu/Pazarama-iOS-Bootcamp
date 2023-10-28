//
//  Swift_Unit_Test_ProjectTests.swift
//  Swift Unit Test ProjectTests
//
//  Created by Eken Özlü on 28.10.2023.
//

import XCTest
@testable import Swift_Unit_Test_Project

final class Swift_Unit_Test_ProjectTests: XCTestCase {
    
    let math = MathFunctions()
    
    func testAddFunction() throws {
        let result = math.add(x: 10, y: 5)
        XCTAssertEqual(result, 15)
    }
    
    func testMultiplyFunction() throws {
        let result = math.multiply(x: 2, y: 8)
        XCTAssertEqual(result, 16)
    }
    
    func testSubstructFunction() throws {
        let result = math.substruct(x: 18, y: 9)
        XCTAssertEqual(result, 2)
    }

}
