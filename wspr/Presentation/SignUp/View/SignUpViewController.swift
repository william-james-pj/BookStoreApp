//
//  SignUpViewController.swift
//  wspr
//
//  Created by Pinto Junior, William James on 14/01/22.
//

import UIKit

class SignUpViewController: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var textFieldState: UITextField!
    @IBOutlet weak var textFieldCity: UITextField!
    @IBOutlet weak var activitIndicator: UIActivityIndicatorView!
    
    // MARK: - Variables
    fileprivate var viewModel: SignUpViewModel = {
        return SignUpViewModel()
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showLoading(false)
    }
    
    // MARK: - Setup
    fileprivate func setupView() {
        viewModel.delegate = self
    }
    
    // MARK: - Action
    @IBAction func buttonLogInPresse(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonSelect(_ sender: UIButton) {
        viewModel.getStates()
    }
    
    @IBAction func buttonCitySelect(_ sender: UIButton) {
        viewModel.getCities()
    }
}

extension SignUpViewController: ListViewControllerDelegate {
    func updateItem(_ item: ItemModel) {
        viewModel.setStateSelected(item)
    }
}

extension SignUpViewController: SignUpViewModelDelegate {
    func showTableView(_ listModel: [ItemModel]) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let listVC = storyboard.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController else{
            return
        }
        
        listVC.listView = listModel
        listVC.title = listModel[0].type == .typeState ? "States" : "Cities"
        listVC.delegate = self
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
    func setTextFildeText(_ itemType: ItemType, _ text: String) {
        switch itemType {
        case .typeState:
            textFieldState.text = text
            textFieldCity.text = ""
        case .typeCity:
            textFieldCity.text = text
        }
    }
    
    func showLoading(_ show: Bool) {
        activitIndicator.startAnimating()
        activitIndicator.isHidden = !show
        if(!show) {
            activitIndicator.stopAnimating()
        }
    }
}
