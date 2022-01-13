//
//  LoginView.swift
//  wspr
//
//  Created by Pinto Junior, William James on 13/01/22.
//

import UIKit

class LoginView: UIView {
    @IBOutlet var viewBase: UIView!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder )
        commonInit()
    }
    
    private func commonInit() {
        Bundle(for: type(of: self)).loadNibNamed("LoginView", owner: self, options: nil)
        addSubview(viewBase)
        viewBase.frame = bounds
        viewBase.autoresizingMask = [.flexibleWidth, .flexibleHeight ]
    }
    
    fileprivate func setupTextField() {
        textFieldEmail.delegate = self
        textFieldPassword.delegate = self
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == textFieldEmail {
            print("textFieldEmail")
        } else {
            print("textFieldPassword")
        }
    }
}
