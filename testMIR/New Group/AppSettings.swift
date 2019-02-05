//
//  AppSettings.swift
//  testMIR
//
//  Created by Артём Балашов on 05/02/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

import Foundation
import UIKit

var token: String? {
    set {
        UserDefaults.standard.set(newValue, forKey: "token")
    }
    get {
        return UserDefaults.standard.value(forKey: "token") as? String
    }
}

