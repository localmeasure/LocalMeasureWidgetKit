//
//  LMSource.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 25/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import ObjectMapper

class LMSource: Mappable {
    var link: String?
    var network: String?
    var id: String?
    
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        link    <- map["link"]
        network <- map["network"]
        id      <- map["id"]
    }
}
