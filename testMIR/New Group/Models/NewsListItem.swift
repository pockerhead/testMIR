//
//  NewsListItem.swift
//  testMIR
//
//  Created by Артём Балашов on 09/02/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

import Foundation
import ObjectMapper

struct NewsListItem: Mappable {
    
    var title: String?
    var id: Int?
    var slug: String?
    var link: String?
    var statistics: NewsStatistics?
    var createdAt: String?
    var imageURL: String?
    var thumbnailURL: String?
    var category: NewsCategory?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        title <- map["title"]
        slug <- map["slug"]
        id <- map["id"]
        link <- map["link"]
        statistics <- map["statistics"]
        createdAt <- map["created_at"]
        imageURL <- map["image_url"]
        thumbnailURL <- map["thumbnail_url"]
        category <- map["news_category"]
    }
}

struct NewsStatistics {
    var show: Bool?
    var time: Bool?
    var share: Bool?
    var source: Bool?
    var persual: Bool?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        show <- map["show"]
        time <- map["time"]
        share <- map["share"]
        source <- map["source"]
        persual <- map["persual"]
    }
}

struct NewsCategory {
    var id: Int?
    var title: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
    }
}
