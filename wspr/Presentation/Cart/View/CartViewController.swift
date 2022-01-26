//
//  CartViewController.swift
//  wspr
//
//  Created by Pinto Junior, William James on 25/01/22.
//

import UIKit
import SnapKit

class CartViewController: UIViewController {
    // MARK: - Constantes
    let cartResuseIdentifier = "CartCollectionViewCell"
    
    // MARK: - Variables
    fileprivate var stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Cart"
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate var cartCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(red: 0.133, green: 0.156, blue: 0.192, alpha: 1)
        return collectionView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.133, green: 0.156, blue: 0.192, alpha: 1)
        setupCollection()
        setupView()
    }
    
    // MARK: - Setup
    fileprivate func setupCollection() {
        cartCollectionView.dataSource = self
        cartCollectionView.delegate = self
        cartCollectionView.register(UINib(nibName: cartResuseIdentifier, bundle: nil), forCellWithReuseIdentifier: cartResuseIdentifier)
    }
}

extension CartViewController: CodeView {
    func buildHierarchy() {
        view.addSubview(stackBase)
        stackBase.addArrangedSubview(labelTitle)
        stackBase.addArrangedSubview(cartCollectionView)
    }
    
    func buildConstraints() {
        stackBase.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.bottom.equalTo(view.safeArea.bottom)
            make.leading.trailing.equalToSuperview().inset(25)
        }
    }
}

extension CartViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        return
    }
}

extension CartViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cartResuseIdentifier, for: indexPath) as! CartCollectionViewCell
        return cell
    }
}

extension CartViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        return CGSize(width: width, height: 100)
    }
}
