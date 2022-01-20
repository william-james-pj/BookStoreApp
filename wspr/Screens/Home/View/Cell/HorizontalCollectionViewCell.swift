//
//  HorizontalCollectionViewCell.swift
//  wspr
//
//  Created by Pinto Junior, William James on 19/01/22.
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlet
    @IBOutlet weak var labelTitle: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Methods
    func configureCell(text: String) {
        self.labelTitle.text = text
    }
}
