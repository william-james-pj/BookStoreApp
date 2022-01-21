//
//  OptionsCollectionViewCell.swift
//  wspr
//
//  Created by Pinto Junior, William James on 20/01/22.
//

import UIKit

class OptionsCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlet
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubTitle: UILabel!
    @IBOutlet weak var imageViewIcon: UIImageView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Methods
    func configureCell(title: String, subTitle: String, image: UIImage) {
        self.labelTitle.text = title
        self.labelSubTitle.text = subTitle
        self.imageViewIcon.image = image
    }
}
