//
//  SignUpViewModel.swift
//  wspr
//
//  Created by Pinto Junior, William James on 19/01/22.
//

import Foundation

protocol SignUpViewModelDelegate {
    func showLoading(_ show: Bool)
    func setTextFildeText(_ itemType: ItemType, _ text: String)
    func showTableView(_ listModel: [ItemModel])
}

class SignUpViewModel {
    // MARK: - Variables
    var listModelState: [ItemModel]?
    var listModelCity: [ItemModel]?
    var stateSelected: Int?
    var delegate: SignUpViewModelDelegate?
    
    // MARK: - Init
    init() {
    }
    
    // MARK: - Methods
    func getStates() {
        guard let delegate = delegate else {
            return
        }
        delegate.showLoading(true)
        NetworkMoya.getStates { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.buildListStates(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getCities() {
        guard let delegate = delegate, let stateSelected = stateSelected  else {
            return
        }
        delegate.showLoading(true)
        NetworkMoya.getCity(stateSelected) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.buildListCities(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func buildListStates(_ listDTO: [StateDTO]) {
        let list = listDTO.map({state in
            return ItemModel(id: state.id ?? 0, title: state.name ?? "", type: .typeState)
        })
        listModelState = list.sorted { $0.title.lowercased() < $1.title.lowercased() }
        
        guard let listModelState = listModelState else {
            return
        }
        DispatchQueue.main.async {
            guard let delegate = self.delegate else {
                return
            }
            delegate.showLoading(false)
            delegate.showTableView(listModelState)
        }
    }
    
    func buildListCities(_ listDTO: [CityDTO]) {
        let list = listDTO.map({state in
            return ItemModel(title: state.name ?? "", type: .typeCity)
        })
        listModelCity = list.sorted { $0.title.lowercased() < $1.title.lowercased() }
        
        guard let listModelCity = listModelCity else {
            return
        }
        DispatchQueue.main.async {
            guard let delegate = self.delegate else {
                return
            }
            delegate.showLoading(false)
            delegate.showTableView(listModelCity)
        }
    }
    
    func setStateSelected(_ item: ItemModel) {
        guard let delegate = delegate else {
            return
        }
        delegate.setTextFildeText(item.type, item.title)
        
        switch item.type {
        case .typeState:
            if let stateId = item.id {
                self.stateSelected = stateId
            }
            break
        case .typeCity: break
        }
    }
    
}
