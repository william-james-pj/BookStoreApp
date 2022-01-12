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
    
    var inputId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonSelect(_ sender: UIButton) {
        inputId = 1
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let listVC = storyboard.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController else{
            return
        }
        
        let listModel = ListModel()
        listModel.items = ["State 1", "State 2", "State 3"]
        listVC.listModel = listModel
        
        listVC.delegate = self
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
    @IBAction func buttonCitySelect(_ sender: UIButton) {
        inputId = 2
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let listVC = storyboard.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController else{
            return
        }
        
        let listModel = ListModel()
        listModel.items = ["City 1", "City 2", "City 3"]
        listVC.listModel = listModel
        
        listVC.delegate = self
        self.navigationController?.pushViewController(listVC, animated: true)
    }
}

extension SignUpController: ListViewControllerDelegate {
    func updateItem(_ item: String) {
        switch inputId {
        case 1:
            textFieldState.text = item
        case 2:
            textFieldCity.text = item
        default:
            return
        }
    }
}

