//
//  LogInAndSignUpViewController.swift
//  wspr
//
//  Created by Pinto Junior, William James on 13/01/22.
//

import UIKit

enum WelcomeType {
    case login
    case signup
}

class LogInAndSignUpViewController: UIViewController {
    @IBOutlet weak var loginView: LoginView!
    @IBOutlet weak var signUpView: SignupView!
    
    var welcomeType: WelcomeType = .login
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupContent()
    }
    
    fileprivate func setupContent() {
        loginView.isHidden = welcomeType == .login ? false : true
        signUpView.isHidden = welcomeType == .signup ? false : true
    }

}
