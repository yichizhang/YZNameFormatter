//
//  NameFormatterDemoTests.swift
//  NameFormatterDemoTests
//
//  Created by Yichi on 10/03/2015.
//  Copyright (c) 2015 Yichi. All rights reserved.
//

import UIKit
import XCTest

class NameFormatterDemoTests: XCTestCase {
    
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
        XCTAssert(true, "Pass")
		var nameString:String!
		var name:YZName!
		let formatter = YZNameFormatter()
		
		nameString = "Assoc Professsor Eve Fallshaw"
		name = formatter.nameFrom(string: nameString)
		XCTAssertEqual(name.prefix, "Assoc Professsor", "1")
		XCTAssertEqual(name.firstName, "Eve", "1")
		XCTAssertEqual(name.lastName, "Fallshaw", "1")
		
		nameString = "Emeritus Prof Helen Praetz"
		name = formatter.nameFrom(string: nameString)
		XCTAssertEqual(name.prefix, "Emeritus Prof", "1")
		XCTAssertEqual(name.firstName, "Helen", "1")
		XCTAssertEqual(name.lastName, "Praetz", "1")
		
		nameString = "Assoc Professor Philip Wilksch"
		name = formatter.nameFrom(string: nameString)
		XCTAssertEqual(name.prefix, "Assoc Professsor", "1")
		XCTAssertEqual(name.firstName, "Philip", "1")
		XCTAssertEqual(name.lastName, "Wilksch", "1")
		
		nameString = "Adjunct Profess John Izard"
		name = formatter.nameFrom(string: nameString)
		XCTAssertEqual(name.prefix, "Adjunct Profess", "1")
		XCTAssertEqual(name.firstName, "John", "1")
		XCTAssertEqual(name.lastName, "Izard", "1")
		
		nameString = "Professor Harry McLean"
		name = formatter.nameFrom(string: nameString)
		XCTAssertEqual(name.prefix, "Professsor", "1")
		XCTAssertEqual(name.firstName, "Harry", "1")
		XCTAssertEqual(name.lastName, "McLean", "1")
		
		nameString = "Josh Hall"
		name = formatter.nameFrom(string: nameString)
		XCTAssertEqual(name.prefix, "", "1")
		XCTAssertEqual(name.firstName, "Josh", "1")
		XCTAssertEqual(name.lastName, "Hall", "1")
		
		nameString = "Mr Harry Hall"
		name = formatter.nameFrom(string: nameString)
		XCTAssertEqual(name.prefix, "Mr", "1")
		XCTAssertEqual(name.firstName, "Harry", "1")
		XCTAssertEqual(name.lastName, "Hall", "1")
		
		nameString = "Dr Harry Hamilton"
		name = formatter.nameFrom(string: nameString)
		XCTAssertEqual(name.prefix, "Dr", "1")
		XCTAssertEqual(name.firstName, "Harry", "1")
		XCTAssertEqual(name.lastName, "Hamilton", "1")
		
		nameString = "Dr Aaron Johnston"
		name = formatter.nameFrom(string: nameString)
		XCTAssertEqual(name.prefix, "Dr", "1")
		XCTAssertEqual(name.firstName, "Aaron", "1")
		XCTAssertEqual(name.lastName, "Johnston", "1")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
