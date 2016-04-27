//
//  Widget.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 25/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import ObjectMapper

class LMWidget: Mappable {
    var background_time: String?
    var hash: String?
    var description: String?
    var title: String?
    var created_at: String?
    var date_start: String?
    var locations: [LMLocation]?
    var is_frozen: Bool?
    var post_time: String?
    var limit: Int?
    var no_load_more: Bool?
    var order_by: String?
    var no_branding: Bool?
    var type: String?
    var date_end: String?
    var grid_size: String?
    
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
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
