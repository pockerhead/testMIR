//
//  LoginViewController.swift
//  testMIR
//
//  Created by Артём Балашов on 05/02/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import TweeTextField

class LoginViewController: UIViewController, Alertable, Loadable {

    //MARK: - IBOutlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextfield: TweeActiveTextField!
    @IBOutlet weak var emailTextfield: TweeActiveTextField!
    
    //MARK: - Properties
    let disposeBag = DisposeBag()
    var viewModel: LoginViewModelInterface!
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bindUI()
    }
    
    //MARK: - UI Configuration
    private func configureUI() {
        // UI Configuration
        emailTextfield.text = "devtest@medsolutions.ru"
        passwordTextfield.text = "qwerty"
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
    }
    
    //MARK: - Bindings
    private func bindUI() {
        emailTextfield.rx.text.asDriver(onErrorJustReturn: "").drive(viewModel.userNamePS).disposed(by: disposeBag)
        passwordTextfield.rx.text.asDriver(onErrorJustReturn: "").drive(viewModel.passwordPS).disposed(by: disposeBag)
        loginButton.rx.tap.asObservable().bind(to: viewModel.loginButtonPS).disposed(by: disposeBag)
        viewModel.alertPS.subscribe(onNext: {[weak self] (message) in
            guard let `self` = self else {return}
            self.showAlert(message: message)
        }).disposed(by: disposeBag)
        viewModel.loadingPS.subscribe(onNext: {[weak self] (isLoading) in
            guard let `self` = self else {return}
            if isLoading {
                self.startLoading()
            } else {
                self.stopLoading()
            }
        }).disposed(by: disposeBag)
    }
    
}
