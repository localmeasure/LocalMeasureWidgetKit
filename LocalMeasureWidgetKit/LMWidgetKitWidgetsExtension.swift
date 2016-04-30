//
//  LMWidgetKitWidgetsExtension.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 26/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import Alamofire
import ObjectMapper

extension LMWidgetKit {
    
    /**
     Makes a request to the Local Measure API and async returns the list of widgets.
     
     You pass it a closure as a completion handler. Once the API call has returned the list of widgets, your closure will handle the results.
     
     - Parameter success: a closure passing an array of `LMWidget` and returning `Void` if HTTP call and data parsing are successful
     - Parameter failure: a closure passing an `NSError` if the HTTP call or data parsing failed
     */
    public func widgets(success: (widgets: [LMWidget]) -> Void, failure: (error: NSError) -> Void) {
        do {
            let url = try "\(LMWidgetKitSetup.sharedInstance.getURL())/widgets.json"
            Alamofire.request(.GET, url).responseJSON { response in
                if let JSON = response.result.value {
                    success( widgets: self.parseJSON(JSON) )
                } else {
                    let e = NSError(domain: "kCFErrorHTTPParseFailure", code: 303, userInfo: ["localizedDescription": "The HTTP server response could not be parsed."])
                    failure(error: e)
                }
            }
        } catch {
            let e = NSError(domain: "kCFErrorHTTPBadURL", code: 305, userInfo: ["localizedDescription": "The requested URL could not be retrieved."])
            failure(error: e)
        }
    }
    
    /**
     Parses the JSON returned by the API call using the ObjectMapper library.
     
     - Parameter JSON: an AnyObject representing our JSON
     - Returns [LMWidget]: our list of `LMWidget`
     */
    private func parseJSON(JSON: AnyObject) -> [LMWidget] {
        var widgets = [LMWidget]()
        for item in JSON as! [AnyObject] {
            let widget = Mapper<LMWidget>().map(item)
            widgets.append(widget!)
        }
        
        return widgets
    }
    
}
