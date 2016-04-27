//
//  LMImageMeta.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 25/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import ObjectMapper

public class LMImageMeta: Mappable {
    public var url: String?
    public var width: Int?
    public var height: Int?
    
    public required init?(_ map: Map) {}
    
    public func mapping(map: Map) {
        url    <- map["url"]
        width  <- map["width"]
        height <- map["height"]
    }
}
