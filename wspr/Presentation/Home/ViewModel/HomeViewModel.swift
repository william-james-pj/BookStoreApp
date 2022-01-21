//
//  HomeViewModel.swift
//  wspr
//
//  Created by Pinto Junior, William James on 19/01/22.
//

import Foundation

class HomeViewModel {
    // MARK: - Variables
    fileprivate var categoriesUseCase: CategoriesUseCase = { return GetCategories() }()
    fileprivate var bookUseCase: BookUseCase = { return GetBooks() }()
    
    // MARK: - Init
    init() {
    }
    
    // MARK: - Methods
    func getCategories() -> [Category] {
        return categoriesUseCase.getCategories()
    }
    
    func getBooks() -> [Book] {
        return bookUseCase.getBooks()
    }
}
