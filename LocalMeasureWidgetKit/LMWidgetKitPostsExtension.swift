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
    
    /**
     Makes a request to the Local Measure API and async returns the list of posts for a widget.
     
     You pass it a widget hash and a closure as a completion handler. Once the API call has returned the list of widgets, your closure will handle the results.
     
     - Parameter widgetHash: the hash of the widget you want to get posts from
     - Parameter completion: a closure passing an array of `LMWidget` and returning `Void`
     */
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
    
    
    /**
     Parses the JSON returned by the API call using the ObjectMapper library.
     
     - Parameter JSON: an AnyObject representing our JSON
     - Returns [LMPost]: our list of `LMPost`
     */
    private func parseJSON(JSON: AnyObject) -> [LMPost] {
        var posts = [LMPost]()
        for item in JSON as! [AnyObject] {
            let post = Mapper<LMPost>().map(item)
            posts.append(post!)
        }
        
        return posts
    }
    
    
    /**
     Gives the correct URL to the widget by determining wether we're in test mode or not.
     
     - Parameter widgetHash: the hash of the widget you want to get posts from
     - Returns: the correct URL to the widget
     */
    private func widgetURL(widgetHash: String) -> String {
        if LMWidgetKitSetup.sharedInstance.testEnv {
            return "file:///\(NSBundle(forClass: LMWidget.self).bundlePath)/widget_posts.json"
        } else {
            return "https://cdn.getlocalmeasure.com/public/\(widgetHash)/frozen.json"
        }
    }
    
}