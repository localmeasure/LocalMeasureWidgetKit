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
    
    func widgets(completion: (widgets: [LMWidget]) -> Void) {
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
    
    private func parseJSON(JSON: AnyObject) -> [LMWidget] {
        var widgets = [LMWidget]()
        for item in JSON as! [AnyObject] {
            let widget = Mapper<LMWidget>().map(item)
            widgets.append(widget!)
        }
        
        return widgets
    }
    
}
