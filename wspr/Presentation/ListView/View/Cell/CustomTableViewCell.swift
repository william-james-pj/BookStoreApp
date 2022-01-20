//
//  CustomTableViewCell.swift
//  wspr
//
//  Created by Pinto Junior, William James on 13/01/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var labelItem: UILabel!
    @IBOutlet weak var viewColor: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        labelItem.textColor = .white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(_ item: ItemModel) {
        self.labelItem.text = item.title
        viewColor.backgroundColor = item.color
    }
    
}
