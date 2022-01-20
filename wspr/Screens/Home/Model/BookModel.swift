//
//  BookModel.swift
//  wspr
//
//  Created by Pinto Junior, William James on 20/01/22.
//

import Foundation

class BookModel {
    var title: String
    var price: Double
    
    init() {
        title = ""
        price = 0
    }
    
    init(title: String, price: Double) {
        self.title = title
        self.price = price
    }
}
