//
//  PostsGatewayTests.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 26/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import XCTest

class PostsGatewayTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        LMWidgetKitSetup.sharedInstance.testEnv = true
    }

    func testGetPosts() {
        let loadedExpectation = expectationWithDescription("Loaded widgets.")
        
        LMWidgetKit().posts("localmeasure", completion: { (posts) -> Void in
            XCTAssertGreaterThan(posts.count, 0, "Failed to return posts.")
            loadedExpectation.fulfill()
        })
        
        waitForExpectationsWithTimeout(15, handler: { error in
            XCTAssertNil(error, "Error loading posts.")
        })
    }
    
    func testGetPostsWithNoHash() {
        LMWidgetKitSetup.sharedInstance.testEnv = true
        let loadedExpectation = expectationWithDescription("Loaded widgets.")
        
        LMWidgetKit().posts("", completion: { (posts) -> Void in
            XCTAssertEqual(posts.count, 0, "Failed to return posts.")
            loadedExpectation.fulfill()
        })
        
        waitForExpectationsWithTimeout(15, handler: { error in
            XCTAssertNil(error, "Error loading posts.")
        })
    }

}
