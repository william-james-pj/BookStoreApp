//
//  BookModel.swift
//  wspr
//
//  Created by Pinto Junior, William James on 20/01/22.
//

import Foundation

class Book {
    var title: String
    var price: Double
    var description: String
    
    init() {
        title = ""
        price = 0
        description = ""
    }
    
    init(title: String, price: Double, description: String, imageName: String) {
        self.title = title
        self.price = price
        self.description = description
    }
}
