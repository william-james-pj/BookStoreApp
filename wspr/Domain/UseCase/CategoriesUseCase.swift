//
//  CategoriesUseCase.swift
//  wspr
//
//  Created by Pinto Junior, William James on 21/01/22.
//

import Foundation

protocol CategoriesUseCase {
    func getCategories() -> [Category]
}

class GetCategories: CategoriesUseCase {
    let categories: [Category] = [Category(title: "All"), Category(title: "Horror"), Category(title: "Mystery"),
                                  Category(title: "Crime"), Category(title: "Thriller"), Category(title: "Classic")]
    
    func getCategories() -> [Category] {
        return categories
    }
}
