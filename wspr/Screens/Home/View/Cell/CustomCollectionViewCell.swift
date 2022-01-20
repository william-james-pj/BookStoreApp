//
//  CustomCollectionViewCell.swift
//  wspr
//
//  Created by Pinto Junior, William James on 14/01/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlet
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Methods
    func configureCell(text: String, price: Double) {
        self.labelTitle.text = text
        self.labelPrice.text = "$\(price)"
    }

}
