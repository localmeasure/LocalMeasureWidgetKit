//
//  LMSource.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 25/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import ObjectMapper

public class LMSource: Mappable {
    public var link: String?
    public var network: String?
    public var id: String?
    
    public required init?(_ map: Map) {}
    
    public func mapping(map: Map) {
        link    <- map["link"]
        network <- map["network"]
        id      <- map["id"]
    }
}
