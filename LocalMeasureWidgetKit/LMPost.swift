//
//  LMPost.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 25/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import ObjectMapper

class LMPost: Mappable {
    var rating: Int?
    var text: String?
    var image: String?
    var video: String?
    var imageSize: LMImageSize?
    var images: [LMImageMeta]?
    var kind: String?
    var created: String?
    var source: LMSource?
    var poster: LMPoster?
    var link: String?
    
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        rating    <- map["rating"]
        text      <- map["text"]
        image     <- map["image"]
        video     <- map["video"]
        imageSize <- map["image_size"]
        images    <- map["images"]
        kind      <- map["kind"]
        created   <- map["created"]
        source    <- map["source"]
        poster    <- map["poster"]
        link      <- map["link"]
    }
}
