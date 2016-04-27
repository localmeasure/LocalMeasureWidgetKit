//
//  LMPost.swift
//  LocalMeasureWidgetKit
//
//  Created by solal on 25/04/2016.
//  Copyright © 2016 solal. All rights reserved.
//

import ObjectMapper

public class LMPost: Mappable {
    public var rating: Int?
    public var text: String?
    public var image: String?
    public var video: String?
    public var imageSize: LMImageSize?
    public var images: [LMImageMeta]?
    public var kind: String?
    public var created: String?
    public var source: LMSource?
    public var poster: LMPoster?
    public var link: String?
    
    public required init?(_ map: Map) {}
    
    public func mapping(map: Map) {
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
