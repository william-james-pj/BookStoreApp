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
}
