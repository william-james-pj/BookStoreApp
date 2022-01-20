//
//  HomeViewModel.swift
//  wspr
//
//  Created by Pinto Junior, William James on 19/01/22.
//

import Foundation

class HomeViewModel {
    // MARK: - Variables
    let categroies: [Category] = [Category(title: "All"), Category(title: "Horror"), Category(title: "Mystery"),
                                  Category(title: "Crime"), Category(title: "Thriller"), Category(title: "Classic")]
    let books: [Book] = [Book(title: "Lord of the Rings", price: 20.90), Book(title: "Alice's Adventures in Wonderland", price: 15.90),
                         Book(title: "The Survivors: A Novel", price: 16.90), Book(title: "The Lost Boys of Montauk", price: 22.90),
                         Book(title: "Carrie", price: 13.90), Book(title: "'Salem's Lot", price: 15.90), Book(title: "The Outsider", price: 18.90),
                         Book(title: "Great Circle", price: 8.90)]
    
    // MARK: - Init
    init() {
    }
    
    // MARK: - Methods
    func getCategroies() -> [Category] {
        return categroies
    }
    
    func getCategroiesCount() -> Int {
        return categroies.count
    }
    
    func getBooks() -> [Book] {
        return books
    }
    
    func getBookCount() -> Int {
        return books.count
    }
}
