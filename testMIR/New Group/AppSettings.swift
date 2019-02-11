//
//  AppSettings.swift
//  testMIR
//
//  Created by Артём Балашов on 05/02/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

import Foundation
import UIKit

//MARK: - USER

var storedToken: String? {
    set {
        UserDefaults.standard.set(newValue, forKey: "token")
    }
    get {
        return UserDefaults.standard.value(forKey: "token") as? String
    }
}


//MARK: - NETWORK

typealias Headers = [String : String]
var defaultHeaders: Headers {
    return [
        "Client-Type": "ios",
        "Accept": "application/json"
    ]
}
