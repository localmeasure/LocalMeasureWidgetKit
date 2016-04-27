//
//  LMImageSize.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 25/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import ObjectMapper

class LMImageSize: Mappable {
    var width: Int?
    var height: Int?
    
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        width  <- map["width"]
        height <- map["height"]
    }
}
