//
//  LogInViewController.swift
//  wspr
//
//  Created by Pinto Junior, William James on 12/01/22.
//

import UIKit

class LogInViewController: UIViewController {
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
    }
    
    fileprivate func setupTextField() {
        textFieldEmail.delegate = self
        textFieldPassword.delegate = self
    }
    
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == textFieldEmail {
            print("textFieldEmail")
        } else {
            print("textFieldPassword")
        }
    }
}
