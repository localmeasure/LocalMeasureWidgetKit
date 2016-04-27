//
//  LMWidgetKitTests.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 25/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import XCTest

class LMWidgetKitTests: XCTestCase {

    override func setUp() {
        super.setUp()
        LMWidgetKit().setup("localmeasure")
    }
    
    func testSetup() {
        do {
            let url = try LMWidgetKitSetup.sharedInstance.getURL()
            XCTAssertEqual(url, "https://cdn.getlocalmeasure.com/public/localmeasure", "The wrong value was fetched from the `getUserHash()` method.")
        } catch {
            XCTFail("Setup threw an error.")
        }
    }
    
}
