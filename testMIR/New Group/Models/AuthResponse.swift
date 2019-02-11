//
//  AuthResponse.swift
//  testMIR
//
//  Created by Артём Балашов on 09/02/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

import Foundation
import ObjectMapper

struct AuthResponse: Mappable {
    
    var token: String?
    var tokenType: TokenType?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        token <- map["access_token"]
        var tokenTypeRaw: String? = nil
        tokenTypeRaw <- map["token_type"]
        tokenType = TokenType.init(rawValue: tokenTypeRaw?.lowercased() ?? "")
    }
}

enum TokenType: String {
    case bearer = "bearer"
    
    var capitalized: String {
        return self.rawValue.capitalized
    }
}
