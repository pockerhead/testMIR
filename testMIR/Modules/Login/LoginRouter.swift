//
//  LoginRouter.swift
//  testMIR
//
//  Created by Артём Балашов on 05/02/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

import Foundation
import UIKit

class LoginRouter: LoginWireframeInterface {
    weak var viewController: UIViewController?
    
    func navigate(to option: LoginNavigationOption) {
        let vc: UIViewController!
        switch option {
        case .news:
            fatalError("NOT IMPLEMENTED")
        }
        if vc is UINavigationController {
            viewController?.present(vc, animated: true, completion: nil)
        } else {
            viewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

