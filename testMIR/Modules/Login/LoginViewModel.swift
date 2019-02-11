//
//  LoginViewModel.swift
//  testMIR
//
//  Created by Артём Балашов on 05/02/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class LoginViewModel: LoginViewModelInterface {
    
    var userNamePS: Variable<String?> = Variable<String?>("")
    var passwordPS: Variable<String?> = Variable<String?>("")
    var loginButtonPS: PublishSubject<Void> = PublishSubject<Void>()
    var loadingPS: PublishSubject<Bool> = PublishSubject<Bool>()
    var alertPS: PublishSubject<String> = PublishSubject<String>()
    let router: LoginWireframeInterface
    let disposeBag = DisposeBag()
    
    init(router: LoginWireframeInterface) {
        self.router = router
        bind()
    }
    
    private func bind() {
        loginButtonPS.subscribe(onNext: {[weak self] _ in
            guard let `self` = self else {return}
            guard let userName = self.userNamePS.value, userName != "", let password = self.passwordPS.value, password != "" else {
                self.alertPS.onNext("Данные не введены")
                return
            }
            self.loadingPS.onNext(true)
            AuthService.auth(userName: userName, password: password).subscribe(onSuccess: {[weak self] (response) in
                guard let `self` = self else {return}
                guard let token = response.token, let tokenType = response.tokenType?.capitalized else {
                    self.loadingPS.onNext(false)
                    self.alertPS.onNext("Данные повреждены или имеют некорректный формат")
                    return
                }
                self.loadingPS.onNext(false)
                storedToken = "\(tokenType) \(token)"
                self.router.navigate(to: .news)
                }, onError: {(error) in
                    self.loadingPS.onNext(false)
                    if let error = error as? MoyaError {
                        print(error.failureReason ?? error.localizedDescription)
                    } else {
                        print(error.localizedDescription)
                    }
                    self.alertPS.onNext("Неверный email и/или пароль")
            }).disposed(by: self.disposeBag)
        }).disposed(by: disposeBag)
    }
    
}
