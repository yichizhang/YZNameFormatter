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
    
    func testProfessorNames() {
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
		
		nameString = "Dr Vanessa Panettieri"
		name = formatter.nameFrom(string: nameString)
		XCTAssertEqual(name.prefix, "Dr", "1")
		XCTAssertEqual(name.firstName, "Vanessa", "1")
		XCTAssertEqual(name.lastName, "Panettieri", "1")
		
    }
	
	func testVietnameseVanNames() {
		// This is an example of a functional test case.
		XCTAssert(true, "Pass")
		var nameString:String!
		var name:YZName!
		let formatter = YZNameFormatter()
		
		nameString = "Mr Brinh Tu Van"
		name = formatter.nameFrom(string: nameString)
		XCTAssertEqual(name.prefix, "Mr", "1")
		XCTAssertEqual(name.firstName, "Brinh Tu", "1")
		XCTAssertEqual(name.lastName, "Van", "1")
		
		nameString = "Ms Van Phung Thanh"
		name = formatter.nameFrom(string: nameString)
		XCTAssertEqual(name.prefix, "Ms", "1")
		XCTAssertEqual(name.firstName, "Van Phung", "1")
		XCTAssertEqual(name.lastName, "Thanh", "1")
	}
	
	func testDutchVanNames() {
		// This is an example of a functional test case.
		XCTAssert(true, "Pass")
		var nameString:String!
		var name:YZName!
		let formatter = YZNameFormatter()
		
		nameString = "Mr Mike Van Den Acker"
		name = formatter.nameFrom(string: nameString)
		XCTAssertEqual(name.prefix, "Mr", "1")
		XCTAssertEqual(name.firstName, "Mike", "1")
		XCTAssertEqual(name.lastName, "Van Den Acker", "1")
		
		nameString = "Ms Kane Van Oorschot"
		name = formatter.nameFrom(string: nameString)
		XCTAssertEqual(name.prefix, "Ms", "1")
		XCTAssertEqual(name.firstName, "Kane", "1")
		XCTAssertEqual(name.lastName, "Van Oorschot", "1")
		
	}

	func testOtherNames() {
		// This is an example of a functional test case.
		XCTAssert(true, "Pass")
		var nameString:String!
		var name:YZName!
		let formatter = YZNameFormatter()
		
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
		
		nameString = "Ms Courtney Sullivan"
		name = formatter.nameFrom(string: nameString)
		XCTAssertEqual(name.prefix, "Ms", "1")
		XCTAssertEqual(name.firstName, "Courtney", "1")
		XCTAssertEqual(name.lastName, "Sullivan", "1")
		
		nameString = "Mr Jogvan Klein"
		name = formatter.nameFrom(string: nameString)
		XCTAssertEqual(name.prefix, "Mr", "1")
		XCTAssertEqual(name.firstName, "Jogvan", "1")
		XCTAssertEqual(name.lastName, "Klein", "1")
		
		nameString = "Mr Giovanni Colonna"
		name = formatter.nameFrom(string: nameString)
		XCTAssertEqual(name.prefix, "Mr", "1")
		XCTAssertEqual(name.firstName, "Giovanni", "1")
		XCTAssertEqual(name.lastName, "Colonna", "1")
	}

	func testComplexNames() {
		// This is an example of a functional test case.
		XCTAssert(true, "Pass")
		var nameString:String!
		var name:YZName!
		let formatter = YZNameFormatter()
		
		nameString = "Dr Catherine Hall-Van Den Elsen"
		name = formatter.nameFrom(string: nameString)
		XCTAssertEqual(name.prefix, "Dr", "1")
		XCTAssertEqual(name.firstName, "Catherine", "1")
		XCTAssertEqual(name.lastName, "Hall-Van Den Elsen", "1")
		
		nameString = "Mr James Van-Van Den Elsen"
		name = formatter.nameFrom(string: nameString)
		XCTAssertEqual(name.prefix, "Mr", "1")
		XCTAssertEqual(name.firstName, "James", "1")
		XCTAssertEqual(name.lastName, "Van-Van Den Elsen", "1")
		
	}
	
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
