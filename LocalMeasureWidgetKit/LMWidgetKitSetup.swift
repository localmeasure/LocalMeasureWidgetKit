//
//  LMWidgetKitSetup.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 25/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import Foundation

/**
 A singleton class to manage storage of the user hash.
 */
internal class LMWidgetKitSetup {
    static let sharedInstance = LMWidgetKitSetup()
    private init() {}
    private var userHash: String?
    var testEnv = false
    
    /**
     Stores the user hash for the entire session
     
     - Parameter userHash: The user's hash
     - Throws: `LMSetupError.emptyUserHash` if the method has been called with an empty user hash
    */
    func setUserHash(userHash: String) throws {
        if userHash.isEmpty {
            print("User hash cannot be empty.")
            throw LMSetupError.emptyUserHash
        } else {
            self.userHash = userHash
        }
    }
    
    
    /**
     Gives the URL to the user's widget using her user hash
     
     - Throws: `LMSetupError.emptyUserHash` if the setup method has been called with an empty user hash
     - Returns: A string representing the URL to the user's widget
     */
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

/**
 An `enum` listing the error types that can be thrown
 */
internal enum LMSetupError: ErrorType {
    case emptyUserHash
}