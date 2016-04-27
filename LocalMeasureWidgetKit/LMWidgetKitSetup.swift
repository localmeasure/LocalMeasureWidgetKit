//
//  LMWidgetKitSetup.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 25/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import Foundation

internal class LMWidgetKitSetup {
    static let sharedInstance = LMWidgetKitSetup()
    private init() {}
    private var userHash: String?
    var testEnv = false
    
    
    func setUserHash(userHash: String) throws {
        if userHash.isEmpty {
            print("User hash cannot be empty.")
            throw LMSetupError.emptyUserHash
        } else {
            self.userHash = userHash
        }
    }
    
    func getURL() throws -> String {
        if self.testEnv {
            return "file:///\(NSBundle(forClass: LMWidget.self).bundlePath)"
        } else {
            if self.userHash != nil {
                return "https://cdn.getlocalmeasure.com/public/\(self.userHash!)"
            } else {
                print("User hash was not set properly.")
                throw LMSetupError.emptyUserHash
            }
        }
    }
    
}


internal enum LMSetupError: ErrorType {
    case emptyUserHash
}