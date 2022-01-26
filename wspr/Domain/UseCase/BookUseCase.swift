//
//  BookUseCase.swift
//  wspr
//
//  Created by Pinto Junior, William James on 21/01/22.
//

import Foundation
import UIKit

protocol BookUseCase {
    func getBooks() -> [Book]
}

class GetBooks: BookUseCase {
    let books: [Book] = [Book(title: "Lord of the Rings", price: 20.90,
                              description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse congue lacinia enim, at maximus risus tempor a. Ut blandit quis dolor ac fermentum. Aenean eu lectus massa.",
                              image: UIImage(named: "loadofthe")!),
                         
                         Book(title: "Alice's Adventures in Wonderland", price: 15.90,
                              description: "Nullam eleifend, ligula vitae suscipit fringilla, erat magna consectetur lorem, a malesuada odio est eget metus.",
                              image: UIImage(named: "alice")!),
                         
                         Book(title: "Dune", price: 16.90,
                              description: "Vestibulum iaculis, arcu a consectetur rutrum, ipsum leo congue sapien, non dignissim nunc est at lectus. In euismod fermentum felis quis faucibus.",
                              image: UIImage(named: "dune")!),
                         
                         Book(title: "Pet Sematary", price: 22.90,
                              description: "Fusce convallis urna sit amet diam vehicula consequat. Nulla leo velit, egestas non turpis dictum, ultricies mollis justo. Phasellus vitae odio sit amet tortor accumsan finibus.",
                              image: UIImage(named: "pet")!),
                         
                         Book(title: "Carrie", price: 13.90,
                              description: "Vivamus maximus, purus nec tempus feugiat, sem enim tincidunt nisi, et tincidunt massa sem finibus orci. Etiam varius condimentum nisi, facilisis accumsan augue interdum molestie.",
                              image: UIImage(named: "carrie")!),
                         
                         Book(title: "'Salem's Lot", price: 15.90,
                              description: "Aenean molestie nisl ac imperdiet dignissim. Morbi mauris velit, mollis sit amet ullamcorper eu, accumsan eget magna. Vestibulum eget dictum leo. Phasellus ac odio porttitor, bibendum ipsum eu, molestie lectus.",
                              image: UIImage(named: "salen")!),
                         
                         Book(title: "The Outsider", price: 18.90,
                              description: "Vivamus diam orci, facilisis id dapibus at, maximus vitae erat. Nam ut mi felis. Mauris ex risus, vulputate sit amet quam at, cursus dapibus elit. Pellentesque et sagittis nisi, ac tristique magna.",
                              image: UIImage(named: "outsider")!),
                         
                         Book(title: "The Institute", price: 8.90,
                              description: "Aliquam quis gravida quam. Nullam sed tempus ligula, quis faucibus metus. Morbi tortor lectus, dapibus nec viverra non, tincidunt vel ligula.",
                              image: UIImage(named: "institute")!)]
    
    func getBooks() -> [Book] {
        return books
    }
}
