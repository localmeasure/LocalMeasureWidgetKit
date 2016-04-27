//
//  LMWidgetKitPostsExtension.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 26/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import Alamofire
import ObjectMapper

extension LMWidgetKit {
    
    public func posts(widgetHash: String, completion: (posts: [LMPost]) -> Void) {
        if widgetHash.isEmpty {
            print("An empty widget hash was passed.")
            return completion( posts: [LMPost]() )
        } else {
            let url = self.widgetURL(widgetHash)
            Alamofire.request(.GET, url).responseJSON { response in
                if let JSON = response.result.value {
                    let postList: AnyObject? = JSON["posts"]!
                    completion( posts: self.parseJSON(postList!) )
                } else {
                    completion( posts: [LMPost]() )
                }
            }
        }
    }
    
    private func parseJSON(JSON: AnyObject) -> [LMPost] {
        var posts = [LMPost]()
        for item in JSON as! [AnyObject] {
            let post = Mapper<LMPost>().map(item)
            posts.append(post!)
        }
        
        return posts
    }
    
    private func widgetURL(widgetHash: String) -> String {
        if LMWidgetKitSetup.sharedInstance.testEnv {
            return "file:///\(NSBundle(forClass: LMWidget.self).bundlePath)/widget_posts.json"
        } else {
            return "https://cdn.getlocalmeasure.com/public/\(widgetHash)/frozen.json"
        }
    }
    
}