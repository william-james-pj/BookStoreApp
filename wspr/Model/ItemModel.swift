//
//  ItemModel.swift
//  wspr
//
//  Created by Pinto Junior, William James on 13/01/22.
//

import Foundation
import UIKit

enum ItemType {
    case typeState
    case typeCity
}

class ItemModel {
    var id: Int?
    var title: String = ""
    var color: UIColor?
    var type: ItemType = .typeState
    
    init(){
    }
    
    init(title: String, color: UIColor? = .green, type: ItemType ){
        self.title = title
        self.color = color
        self.type = type
    }
    
    init(id: Int, title: String, color: UIColor? = .green, type: ItemType ){
        self.id = id
        self.title = title
        self.color = color
        self.type = type
    }
}
