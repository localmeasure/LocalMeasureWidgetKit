//
//  WidgetsGatewayTests.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 26/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import XCTest

class WidgetsGatewayTests: XCTestCase {
    
    func testGetWidgets() {
        LMWidgetKitSetup.sharedInstance.testEnv = true
        LMWidgetKit().setup("localmeasure")
        let loadedExpectation = expectationWithDescription("Loaded widgets.")
        
        LMWidgetKit().widgets { (widgets) -> Void in
            XCTAssertGreaterThan(widgets.count, 0, "Failed to return widgets.")
            loadedExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(15, handler: { error in
            XCTAssertNil(error, "Error loading widgets")
        })
    }
    
}
