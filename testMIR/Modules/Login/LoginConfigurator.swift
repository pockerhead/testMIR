//
//  LoginConfigurator.swift
//  testMIR
//
//  Created by Артём Балашов on 05/02/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

import Foundation
import UIKit

class LoginConfigurator {
    static func createModule() -> UIViewController {
        var view: LoginViewController!
        
        let viewController = UIStoryboard.init(name: "Login", bundle: Bundle.main).instantiateInitialViewController()
        if viewController == nil {
            fatalError("Seems there is no initial view controller in Login.storyboard")
        }
        
        if viewController is UINavigationController {
            view = (viewController as! UINavigationController).viewControllers.first as! LoginViewController
        } else {
            view = viewController as! LoginViewController
        }
        
        let router = LoginRouter()
        let viewModel = LoginViewModel(router: router)
        
        view.viewModel = viewModel
        router.viewController = view
        
        return viewController!
    }
}
