//
//  LMImageSize.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 25/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import ObjectMapper

public class LMImageSize: Mappable {
    public var width: Int?
    public var height: Int?
    
    public required init?(_ map: Map) {}
    
    public func mapping(map: Map) {
        width  <- map["width"]
        height <- map["height"]
    }
}
