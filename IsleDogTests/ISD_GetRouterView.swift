//
//  ISD_GetRouterView.swift
//  IsleDogTests
//
//  Created by Daniel Isaac Mora Osorio on 1/28/20.
//  Copyright © 2020 Daniel Isaac Mora Osorio. All rights reserved.
//

import XCTest

@testable import IsleDog

class ISD_GetRouterView: XCTestCase {

    func testGetViewController() {
        let view = ISD_ListOfDogs_Router.createModule()
        XCTAssertNotNil(view)
    }

}
