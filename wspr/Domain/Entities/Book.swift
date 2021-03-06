//
//  BookModel.swift
//  wspr
//
//  Created by Pinto Junior, William James on 20/01/22.
//

import Foundation

struct Book: Codable, Equatable {
    var id: Int
    var title: String
    var price: Double
    var description: String
    var imageName: String
}
