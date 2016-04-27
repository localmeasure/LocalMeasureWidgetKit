//
//  Widget.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 25/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import ObjectMapper

public class LMWidget: Mappable {
    public var background_time: String?
    public var hash: String?
    public var description: String?
    public var title: String?
    public var created_at: String?
    public var date_start: String?
    public var locations: [LMLocation]?
    public var is_frozen: Bool?
    public var post_time: String?
    public var limit: Int?
    public var no_load_more: Bool?
    public var order_by: String?
    public var no_branding: Bool?
    public var type: String?
    public var date_end: String?
    public var grid_size: String?
    
    public required init?(_ map: Map) {}
    
    public func mapping(map: Map) {
        background_time <- map["background_time"]
        hash            <- map["hash"]
        description     <- map["description"]
        title           <- map["title"]
        created_at      <- map["created_at"]
        date_start      <- map["date_start"]
        locations       <- map["locations"]
        is_frozen       <- map["is_frozen"]
        post_time       <- map["post_time"]
        limit           <- map["limit"]
        no_load_more    <- map["no_load_more"]
        order_by        <- map["order_by"]
        no_branding     <- map["no_branding"]
        type            <- map["type"]
        date_end        <- map["date_end"]
        grid_size       <- map["grid_size"]
    }
}
