//
//  LMWidgetKit.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 25/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import Foundation

class LMWidgetKit {
    
    func setup(userHash: String) {
        do {
            try LMWidgetKitSetup.sharedInstance.setUserHash(userHash)
        } catch {
            let e = error as! LMSetupError
            print("\(e) - LMWidgetKit was not properly setup. Did you use a proper user hash?")
        }
    }
    
}
