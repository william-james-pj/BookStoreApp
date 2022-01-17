//
//  SetupList.swift
//  wspr
//
//  Created by Pinto Junior, William James on 17/01/22.
//

import Foundation

class SetupList {
    func getStates() -> [ItemModel]{
        Network.getStates { [weak self] result in
            guard let _ = self else { return []}
            switch result {
            case .success(let response):
                let list = response.map({state in
                    return ItemModel(id: state.id ?? 0, title: state.name ?? "", type: .typeState)
                })
                return list
            case .failure(let error):
               return []
            }
        }
    }
}
