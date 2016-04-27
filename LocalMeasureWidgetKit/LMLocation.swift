//
//  LMLocation.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 25/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import ObjectMapper

class LMLocation: Mappable {
    var latitude: Float?
    var longitude: Float?
    var address: String?
    var name: String?
    
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        latitude  <- map["latitude"]
        longitude <- map["longitude"]
        address   <- map["address"]
        name      <- map["name"]
    }
}
