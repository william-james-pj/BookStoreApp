//
//  CartViewModel.swift
//  wspr
//
//  Created by Pinto Junior, William James on 26/01/22.
//

import Foundation

class CartViewModel {
    // MARK: - Variables
    fileprivate var bookList: [Book] = []
    
    // MARK: - Init
    init() {
    }
    
    // MARK: - Methods
    func addNewBookSelected(_ newBook: Book) {
        if let _ = bookList.firstIndex(of: newBook) {
            return
        }
        bookList.append(newBook)
    }
    
    func getBooksSelected() -> [Book] {
        return bookList
    }
    
    func getTotalPrice() -> String {
        var total = 0.0
        
        bookList.forEach { element in
            total += element.price
        }
        
        return "$\(String(format: "%.1f", total))"
    }
}
