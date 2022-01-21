//
//  Options.swift
//  wspr
//
//  Created by Pinto Junior, William James on 21/01/22.
//

import Foundation
import UIKit

class Option {
    var title: String
    var subTitle: String
    var icon: UIImage
    
    init(){
        self.title = ""
        self.subTitle = ""
        self.icon = UIImage(systemName: "circle.fill")!
    }

    init(title: String, subtitle: String, iconName: String) {
        self.title = title
        self.subTitle = subtitle
        self.icon = UIImage(systemName: iconName) ?? UIImage(systemName: "circle.fill")!
    }
}
