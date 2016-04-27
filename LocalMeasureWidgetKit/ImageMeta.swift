//
//  LMImageMeta.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 25/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import ObjectMapper

class LMImageMeta: Mappable {
    var url: String?
    var width: Int?
    var height: Int?
    
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        url    <- map["url"]
        width  <- map["width"]
        height <- map["height"]
    }
}
