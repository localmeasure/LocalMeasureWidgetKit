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
     
     - Parameter completion: a closure passing an array of `LMWidget` and returning `Void`
     */
    public func widgets(completion: (widgets: [LMWidget]) -> Void) {
        do {
            let url = try "\(LMWidgetKitSetup.sharedInstance.getURL())/widgets.json"
            Alamofire.request(.GET, url).responseJSON { response in
                if let JSON = response.result.value {
                    completion( widgets: self.parseJSON(JSON) )
                } else {
                    completion( widgets: [LMWidget]() )
                }
            }
        } catch {
            print(error)
            completion( widgets: [LMWidget]() )
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
