//
//  HomeViewModel.swift
//  wspr
//
//  Created by Pinto Junior, William James on 19/01/22.
//

import Foundation

class HomeViewModel {
    // MARK: - Variables
    let categroies: [CategroiesModel] = [CategroiesModel(title: "Horror"), CategroiesModel(title: "Mystery"), CategroiesModel(title: "Crime")
                                         , CategroiesModel(title: "Thriller"), CategroiesModel(title: "Classic"), CategroiesModel(title: "Mystery")]
    
    // MARK: - Init
    init() {
    }
    
    
    func getCategroies() -> [CategroiesModel] {
        return categroies
    }
    
    func getCategroiesCount() -> Int {
        return categroies.count
    }
}
