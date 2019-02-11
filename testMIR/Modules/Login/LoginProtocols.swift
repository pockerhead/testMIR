//
//  LoginProtocols.swift
//  testMIR
//
//  Created by Артём Балашов on 05/02/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

//MARK: Wireframe -
enum LoginNavigationOption {
    case news
}

protocol LoginWireframeInterface: class {
    func navigate(to option: LoginNavigationOption)
}
//MARK: - ViewModel
protocol LoginViewModelInterface {
    var userNamePS:     Variable<String?>       { get }
    var passwordPS:     Variable<String?>       { get }
    var loginButtonPS:  PublishSubject<Void>    { get }
    var loadingPS:      PublishSubject<Bool>    { get }
    var alertPS:        PublishSubject<String>  { get }
}
