//
//  SignUpController.swift
//  wspr
//
//  Created by Pinto Junior, William James on 11/01/22.
//

import UIKit

class SignUpController: UIViewController, StateControllerDelegate {
    @IBOutlet weak var textFieldState: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func buttonSelect(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let stateVC = storyboard.instantiateViewController(withIdentifier: "StateController") as? StateController else{
            return
        }
        stateVC.delegate = self
        self.navigationController?.pushViewController(stateVC, animated: true)
    }
    
    func updateState(_ state: String) {
        textFieldState.text = state
    }
}

