//
//  LMWidgetKitSetupTests.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 25/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import XCTest

class LMWidgetKitSetupTests: XCTestCase {
    
    func testSetUserHashWithEmptyValue() {
        do {
            try LMWidgetKitSetup.sharedInstance.setUserHash("")
            XCTFail("Setup called without a value should have thrown an error.")
        } catch {
            let e = error as! LMSetupError
            XCTAssertEqual(e, LMSetupError.emptyUserHash, "The wrong error was thrown.")
        }
    }
    
    func testSetUserHashWithValue() {
        do {
            try LMWidgetKitSetup.sharedInstance.setUserHash("localmeasure")
        } catch {
            XCTFail("Setup called with a value should not have thrown an error.")
        }
    }
    
    func testGetURL() {
        do {
            try LMWidgetKitSetup.sharedInstance.setUserHash("localmeasure")
            let url = try LMWidgetKitSetup.sharedInstance.getURL()
            XCTAssertEqual(url, "https://cdn.getlocalmeasure.com/public/localmeasure", "The wrong value was fetched from the `getUserHash()` method.")
        } catch {
            XCTFail("Setup called with a value should not have thrown an error.")
        }
    }
    
}
