//
//  HomeViewModel.swift
//  wspr
//
//  Created by Pinto Junior, William James on 19/01/22.
//

import Foundation

class HomeViewModel {
    // MARK: - Variables
    let categroies: [CategroiesModel] = [CategroiesModel(title: "All"), CategroiesModel(title: "Horror"), CategroiesModel(title: "Mystery"),
                                         CategroiesModel(title: "Crime"), CategroiesModel(title: "Thriller"), CategroiesModel(title: "Classic")]
    let books: [BookModel] = [BookModel(title: "Lord of the Rings", price: 20.90), BookModel(title: "Alice's Adventures in Wonderland", price: 15.90),
                              BookModel(title: "The Survivors: A Novel", price: 16.90), BookModel(title: "The Lost Boys of Montauk", price: 22.90),
                              BookModel(title: "Carrie", price: 13.90), BookModel(title: "'Salem's Lot", price: 15.90), BookModel(title: "The Outsider", price: 18.90),
                              BookModel(title: "Great Circle", price: 8.90)]
    
    // MARK: - Init
    init() {
    }
    
    // MARK: - Methods
    func getCategroies() -> [CategroiesModel] {
        return categroies
    }
    
    func getCategroiesCount() -> Int {
        return categroies.count
    }
    
    func getBooks() -> [BookModel] {
        return books
    }
    
    func getBookCount() -> Int {
        return books.count
    }
}
