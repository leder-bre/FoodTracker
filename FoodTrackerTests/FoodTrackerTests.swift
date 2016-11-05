//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Brendan Leder on 2016-10-25.
//  Copyright © 2016 Brendan Leder. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    //MARK: FoodTracker Tests
    //Test to see if Meal initalizer returns properly
    func testMealInitialization() {
        let potentialItem = Meal(name:"Test Meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        let noName = Meal(name:"", photo: nil, rating: 5)
        XCTAssertNil(noName, "EmptyNameInvalid")
        let worseThanXCode = Meal(name: "Tee-Rash", photo: nil, rating: -1)
        XCTAssertNotNil(worseThanXCode)
    }
}
