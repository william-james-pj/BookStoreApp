//
//  WelcomeViewController.swift
//  wspr
//
//  Created by Pinto Junior, William James on 13/01/22.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func logInPress(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewVC = storyboard.instantiateViewController(withIdentifier: "LogInAndSignUpViewController") as? LogInAndSignUpViewController else{
            return
        }
        viewVC.welcomeType = .login
        self.navigationController?.pushViewController(viewVC, animated: true)
    }
    
    @IBAction func signUpPress(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewVC = storyboard.instantiateViewController(withIdentifier: "LogInAndSignUpViewController") as? LogInAndSignUpViewController else{
            return
        }
        viewVC.welcomeType = .signup
        self.navigationController?.pushViewController(viewVC, animated: true)
    }
}
