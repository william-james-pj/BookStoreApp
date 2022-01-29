//
//  CartCollectionViewCell.swift
//  wspr
//
//  Created by Pinto Junior, William James on 26/01/22.
//

import UIKit

class CartCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlet
    @IBOutlet weak var labelBookName: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var imageViewBook: UIImageView!
    @IBOutlet weak var labelQtd: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Action
    @IBAction func buttonMinus(_ sender: UIButton) {
        guard let qtdText = labelQtd.text, let qtd = Int(qtdText) else {
            return
        }
        if qtd - 1 > 0 {
            labelQtd.text = "\(qtd - 1)"
        }
    }
    
    @IBAction func buttonPlus(_ sender: UIButton) {
        guard let qtdText = labelQtd.text, let qtd = Int(qtdText) else {
            return
        }
        labelQtd.text = "\(qtd + 1)"
    }
    
    
    // MARK: - Methods
    func configureCell(book: Book) {
        self.labelBookName.text = book.title
        self.labelPrice.text = "$\(book.price)"
        self.imageViewBook.image = UIImage(named: book.imageName)!
    }
}
