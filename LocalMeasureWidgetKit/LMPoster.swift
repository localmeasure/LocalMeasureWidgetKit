//
//  LMPoster.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 25/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import ObjectMapper

public class LMPoster: Mappable {
    public var source: LMSource?
    public var name: String?
    public var avatar: String?
    
    public required init?(_ map: Map) {}
    
    public func mapping(map: Map) {
        source <- map["source"]
        name   <- map["name"]
        avatar <- map["avatar"]
    }
}
