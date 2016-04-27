//
//  LMPoster.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 25/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import ObjectMapper

class LMPoster: Mappable {
    var source: LMSource?
    var name: String?
    var avatar: String?
    
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        source <- map["source"]
        name   <- map["name"]
        avatar <- map["avatar"]
    }
}
