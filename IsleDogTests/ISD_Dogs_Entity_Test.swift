//
//  ISD_Dogs_Entity_Test.swift
//  IsleDogTests
//
//  Created by Daniel Isaac Mora Osorio on 1/28/20.
//  Copyright © 2020 Daniel Isaac Mora Osorio. All rights reserved.
//

import XCTest

@testable import IsleDog

class ISD_Dogs_Entity_Test: XCTestCase {

    func testJoinADog() {
        let dog = ISD_Dogs_Entity(name: "Rex", description: "Movie actor", age: 8, url: "www")
        XCTAssertTrue(dog.getAge().contains("Almost 8 years"))
    }
    
    func testHaveInfoDog() {
        let dog = ISD_Dogs_Entity(name: "Rex", description: "as", age: 8, url: "www")
        XCTAssertFalse(dog.haveInfo())
    }

}
