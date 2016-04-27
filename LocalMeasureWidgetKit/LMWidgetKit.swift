//
//  LMWidgetKit.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 25/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import Foundation

/**
 The publicly accessible class for setting your user hash and getting widgets and posts.
 */
public class LMWidgetKit {
    
    public init() {}
    
    /**
     Set up your user hash, this method arranges storage of the hash so you don't have to pass it numerous times.
     
     You would typically call this method once, in your AppDelegate.
     
     - Parameter userHash: the user hash from you Local Measure account
     */
    public func setup(userHash: String) {
        do {
            try LMWidgetKitSetup.sharedInstance.setUserHash(userHash)
        } catch {
            let e = error as! LMSetupError
            print("\(e) - LMWidgetKit was not properly setup. Did you use a proper user hash?")
        }
    }
    
}
