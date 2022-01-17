//
//  SignUpViewController.swift
//  wspr
//
//  Created by Pinto Junior, William James on 14/01/22.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var textFieldState: UITextField!
    @IBOutlet weak var textFieldCity: UITextField!
    @IBOutlet weak var activitIndicator: UIActivityIndicatorView!
    
    var listModelState: [ItemModel]?
    var listModelCity: [ItemModel]?
    var stateSelected: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showLoading(false)
    }
    
    @IBAction func buttonSelect(_ sender: UIButton) {
        getStates()
    }
    
    @IBAction func buttonCitySelect(_ sender: UIButton) {
        guard let _ = listModelState else {
            return
        }
        guard let stateSelected = stateSelected else {
            return
        }
        getCities(stateSelected)
    }
    
    fileprivate func showLoading(_ show: Bool) {
        activitIndicator.startAnimating()
        activitIndicator.isHidden = !show
        if(!show) {
            activitIndicator.stopAnimating()
        }
    }
    
    fileprivate func showTableView(_ listModel: [ItemModel]) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let listVC = storyboard.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController else{
            return
        }
        
        listVC.listView = listModel
        
        listVC.delegate = self
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
    fileprivate func getStates() {
        showLoading(true)
        Network.getStates { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.buildListStates(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    fileprivate func buildListStates(_ listState: [StateDTO]) {
        let list = listState.map({state in
            return ItemModel(id: state.id ?? 0, title: state.name ?? "", type: .typeState)
        })
        listModelState = list.sorted { $0.title.lowercased() < $1.title.lowercased() }
        
        guard let listModelState = listModelState else {
            return
        }
        DispatchQueue.main.async {
            self.showLoading(false)
            self.showTableView(listModelState)
        }
    }
    
    fileprivate func getCities(_ stateId: Int) {
        showLoading(true)
        Network.getCity(stateId: stateId) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.buildListCities(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    fileprivate func buildListCities(_ listCity: [CityDTO]) {
        let list = listCity.map({state in
            return ItemModel(title: state.name ?? "", type: .typeCity)
        })
        listModelCity = list.sorted { $0.title.lowercased() < $1.title.lowercased() }
        
        guard let listModelCity = listModelCity else {
            return
        }
        DispatchQueue.main.async {
            self.showLoading(false)
            self.showTableView(listModelCity)
        }
    }
}

extension SignUpViewController: ListViewControllerDelegate {
    func updateItem(_ item: ItemModel) {
        switch item.type {
        case .typeState:
            textFieldState.text = item.title
            
            if let stateId = item.id {
                stateSelected = stateId
            }
            
            break
        case .typeCity:
            textFieldCity.text = item.title
            break
        }
    }
}


