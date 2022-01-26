//
//  BookModel.swift
//  wspr
//
//  Created by Pinto Junior, William James on 20/01/22.
//

import Foundation
import UIKit

class Book {
    var title: String
    var price: Double
    var description: String
    var image: UIImage
    
    init() {
        title = ""
        price = 0
        description = ""
        image = UIImage(systemName: "book.closed")!
    }
    
    init(title: String, price: Double, description: String, image: UIImage) {
        self.title = title
        self.price = price
        self.description = description
        self.image = image
    }
}
