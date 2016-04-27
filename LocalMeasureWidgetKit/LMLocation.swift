//
//  LMLocation.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 25/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import ObjectMapper

public class LMLocation: Mappable {
    public var latitude: Float?
    public var longitude: Float?
    public var address: String?
    public var name: String?
    
    required public init?(_ map: Map) {}
    
    public func mapping(map: Map) {
        latitude  <- map["latitude"]
        longitude <- map["longitude"]
        address   <- map["address"]
        name      <- map["name"]
    }
}
