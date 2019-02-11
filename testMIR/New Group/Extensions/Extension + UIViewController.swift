//
//  Extension + UIViewCotroller.swift
//  testMIR
//
//  Created by Артём Балашов on 09/02/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

import Foundation
import UIKit


protocol Alertable {
    func showAlert(title: String?, message: String?)
    func showAlert(title: String?, message: String?, handler: @escaping ((UIAlertAction) -> Void))
}

extension UIViewController {
    func showAlert(title: String? = nil, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String? = nil, message: String?, handler: @escaping ((UIAlertAction) -> Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "OK", style: .cancel, handler: handler)
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String? = nil, textFieldPlaceholder: String? = nil, keyboardType: UIKeyboardType = .default, contentType: UITextContentType? = nil, message: String?, closeHandler:((UIAlertAction) -> Void)? = nil, submitHandler: @escaping ((String?) -> Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "Cancel", style: .cancel, handler: closeHandler)
        var textField: UITextField!
        alert.addTextField { CLTextField in
            CLTextField.placeholder = textFieldPlaceholder
            textField = CLTextField
            textField.keyboardType = keyboardType
            if #available(iOS 10.0, *), let contentType = contentType {
                textField.textContentType = contentType
            }
        }
        let submit = UIAlertAction(title: "OK", style: .default) { (action) in
            submitHandler(textField.text)
        }
        alert.addAction(close)
        alert.addAction(submit)
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String?, message: String?, closeHandler:((UIAlertAction) -> Void)?, submitHandler: @escaping ((UIAlertAction) -> Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "Cancel", style: .cancel, handler: closeHandler)
        let submit = UIAlertAction(title: "OK", style: .default, handler: submitHandler)
        alert.addAction(close)
        alert.addAction(submit)
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String?, attributedMessage: NSAttributedString, closeHandler:((UIAlertAction) -> Void)?, submitHandler: @escaping ((UIAlertAction) -> Void)){
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        alert.setValue(attributedMessage, forKey: "attributedMessage")
        let close = UIAlertAction(title: "Cancel", style: .cancel, handler: closeHandler)
        let submit = UIAlertAction(title: "OK", style: .default, handler: submitHandler)
        alert.addAction(close)
        alert.addAction(submit)
        present(alert, animated: true, completion: nil)
    }
    
}
