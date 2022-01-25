//
//  LogInViewController.swift
//  wspr
//
//  Created by Pinto Junior, William James on 14/01/22.
//

import UIKit

class LogInViewController: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Setup
    fileprivate func setupTextField() {
        textFieldEmail.delegate = self
        textFieldPassword.delegate = self
    }
    
    // MARK: - Action
    @IBAction func buttonLogInPressed(_ sender: Any) {
        let tabBarHomeVC = TabBarHome()
        self.navigationController?.pushViewController(tabBarHomeVC, animated: true)
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
