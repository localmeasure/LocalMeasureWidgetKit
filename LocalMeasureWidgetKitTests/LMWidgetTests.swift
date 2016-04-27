//
//  LMWidgetTests.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 25/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import XCTest
import ObjectMapper

class WidgetModelTest: XCTestCase {
    
    func widget() -> LMWidget {
        let path = NSBundle(forClass: LMWidget.self).pathForResource("widget_single", ofType: "json")
        var json = ""
        do {
            json = try NSString(contentsOfFile: path!, encoding: NSUTF8StringEncoding) as String
        } catch {
            print("Could not read file.")
        }
        
        return Mapper<LMWidget>().map(json)!
    }
    
    func testBackgroundTime() {
        let widget = self.widget()
        XCTAssertEqual(widget.background_time!, "2014-10-30T23:00:26+00:00", "Background times are not equal.")
    }
    
    func testHash() {
        let widget = self.widget()
        XCTAssertEqual(widget.hash!, "a74e33cf7271a17f0e20344c3eeafe817a646f2fa777f43316417b4306f9", "Hashes are not equal.")
    }
    
    func testDescription() {
        let widget = self.widget()
        XCTAssertEqual(widget.description!, "Like on the beach, hot sand. Squeak, squeak, ouch!", "Descriptions are not equal.")
    }
    
    func testTitle() {
        let widget = self.widget()
        XCTAssertEqual(widget.title!, "Sand", "Titles are not equal.")
    }
    
    func testCreatedAt() {
        let widget = self.widget()
        XCTAssertEqual(widget.created_at!, "2014-10-30T23:00:26+00:00", "Created at times are not equal.")
    }
    
    func testDateStart() {
        let widget = self.widget()
        XCTAssertEqual(widget.date_start!, "2014-10-30T23:00:26+00:00", "Start dates are not equal.")
    }
    
    func testIsFrozen() {
        let widget = self.widget()
        XCTAssertTrue(widget.is_frozen!, "Is frozen status is not properly set")
    }
    
    func testPostTime() {
        let widget = self.widget()
        XCTAssertEqual(widget.post_time!, "2014-10-30T23:00:26+00:00", "Post times are not equal.")
    }
    
    func testLimit() {
        let widget = self.widget()
        XCTAssertEqual(widget.limit!, 20, "Limits are not equal.")
    }
    
    func testNoLoadMore() {
        let widget = self.widget()
        XCTAssertFalse(widget.no_load_more!, "No load more status is not properly set")
    }
    
    func testNoBranding() {
        let widget = self.widget()
        XCTAssertFalse(widget.no_branding!, "No branding status is not properly set")
    }
    
    func testType() {
        let widget = self.widget()
        XCTAssertEqual(widget.type!, "grid", "Types are not equal.")
    }
    
    func testDateEnd() {
        let widget = self.widget()
        XCTAssertEqual(widget.date_end!, "2014-10-30T23:00:26+00:00", "End dates are not equal.")
    }
    
    func testGridSize() {
        let widget = self.widget()
        XCTAssertEqual(widget.grid_size!, "medium", "Grid sizes are not equal.")
    }
    
    func testLocations() {
        let widget = self.widget()
        XCTAssertGreaterThan(widget.locations!.count, 0, "Number of locations is wrong.")
    }
    
}
