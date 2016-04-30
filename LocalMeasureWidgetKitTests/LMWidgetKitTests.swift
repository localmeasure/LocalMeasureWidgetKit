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
        LMWidgetKitSetup.sharedInstance.testEnv = true
    }
    
    func testSetup() {
        LMWidgetKitSetup.sharedInstance.testEnv = false
        LMWidgetKit().setup("localmeasure")
        do {
            let url = try LMWidgetKitSetup.sharedInstance.getURL()
            XCTAssertEqual(url, "https://cdn.getlocalmeasure.com/public/localmeasure", "The wrong value was fetched from the `getUserHash()` method.")
        } catch {
            XCTFail("Setup threw an error.")
        }
    }
    
    func testGetWidgets() {
        let loadedExpectation = expectationWithDescription("Loaded widgets.")
        
        LMWidgetKit().widgets({ (widgets) -> Void in
            XCTAssertGreaterThan(widgets.count, 0, "Failed to return widgets.")
            loadedExpectation.fulfill()
        }, failure: { (error) -> Void in
            XCTFail(error.domain)
        })
        
        waitForExpectationsWithTimeout(3, handler: { error in
            XCTAssertNil(error, "Error loading widgets")
        })
    }
    
    func testGetWidgetsWithError() {
        LMWidgetKitSetup.sharedInstance.testEnv = false
        let loadedExpectation = expectationWithDescription("Loaded widgets.")
        
        LMWidgetKit().widgets({ (widgets) -> Void in
            XCTFail("Call should have failed and not have loaded widgets.")
        }, failure: { (error) -> Void in
            XCTAssertNotNil(error)
            loadedExpectation.fulfill()
        })
        
        waitForExpectationsWithTimeout(1, handler: { error in
            XCTAssertNil(error, "Error loading widgets")
        })
    }
    
    func testGetPosts() {
        let loadedExpectation = expectationWithDescription("Loaded posts.")
        
        LMWidgetKit().posts("localmeasure", success: { (posts) -> Void in
            XCTAssertGreaterThan(posts.count, 0, "Failed to return posts.")
            loadedExpectation.fulfill()
        }, failure: { (error) -> Void in
            XCTFail(error.domain)
        })
        
        waitForExpectationsWithTimeout(3, handler: { error in
            XCTAssertNil(error, "Error loading posts.")
        })
    }
    
    func testGetPostsWithError() {
        let loadedExpectation = expectationWithDescription("Loaded posts.")
        
        LMWidgetKit().posts("", success: { (posts) -> Void in
            XCTFail("Call should have failed and not have loaded posts.")
        }, failure: { (error) -> Void in
            XCTAssertNotNil(error)
            loadedExpectation.fulfill()
        })
        
        waitForExpectationsWithTimeout(3, handler: { error in
            XCTAssertNil(error, "Error loading posts.")
        })
    }
    
}
