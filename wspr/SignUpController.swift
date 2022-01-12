//
//  SignUpController.swift
//  wspr
//
//  Created by Pinto Junior, William James on 11/01/22.
//

import UIKit

class SignUpController: UIViewController {
    @IBOutlet weak var textFieldState: UITextField!
    @IBOutlet weak var textFieldCity: UITextField!
    
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
    
    @IBAction func buttonCitySelect(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let cityVC = storyboard.instantiateViewController(withIdentifier: "CityViewController") as? CityViewController else{
            return
        }
        cityVC.delegate = self
        self.navigationController?.pushViewController(cityVC, animated: true)
    }
}

extension SignUpController: StateControllerDelegate {
    func updateState(_ state: String) {
        textFieldState.text = state
    }
}

extension SignUpController: CityViewControllerDelegate {
    func updateCity(_ city: String) {
        textFieldCity.text = city
    }
}

