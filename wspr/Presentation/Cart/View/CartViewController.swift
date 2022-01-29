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
    var cartList: [Book] = []
    fileprivate var viewModel: CartViewModel = {
        return CartViewModel()
    }()
    
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
    
    fileprivate var labelTotal: UILabel = {
        let label = UILabel()
        label.text = "Total:"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate var labelPrice: UILabel = {
        let label = UILabel()
        label.text = "$0.0"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = UIColor(red: 0.992, green: 0.439, blue: 0.078, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate var buttonPay: UIButton = {
        let button = UIButton()
        button.setTitle("Payment", for: .normal)
        button.backgroundColor = UIColor(red: 0.223, green: 0.243, blue: 0.274, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.tintColor = UIColor(red: 0.992, green: 0.439, blue: 0.078, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    fileprivate var viewLowPriority: UIView = {
        let view = UIView()
        return view
    }()
    
    fileprivate var cartCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(red: 0.133, green: 0.156, blue: 0.192, alpha: 1)
        return collectionView
    }()
    
    fileprivate func stackPrice() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(labelTotal)
        stack.addArrangedSubview(labelPrice)
        return stack
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.133, green: 0.156, blue: 0.192, alpha: 1)
        
        setupCollection()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        do {
            let bookSelected = try UserDefaults.standard.getObject(forKey: "BookSelected", castTo: Book.self)
            
            viewModel.addNewBookSelected(bookSelected)
            reloadData()
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Setup
    fileprivate func setupCollection() {
        cartCollectionView.dataSource = self
        cartCollectionView.delegate = self
        cartCollectionView.register(UINib(nibName: cartResuseIdentifier, bundle: nil), forCellWithReuseIdentifier: cartResuseIdentifier)
    }
    
    // MARK: - Methods
    func reloadData() {
        cartList = viewModel.getBooksSelected()
        labelPrice.text = viewModel.getTotalPrice()
        cartCollectionView.reloadData()
    }
}

extension CartViewController: CodeView {
    func buildHierarchy() {
        view.addSubview(stackBase)
        stackBase.addArrangedSubview(labelTitle)
        stackBase.addArrangedSubview(cartCollectionView)
        stackBase.addArrangedSubview(stackPrice())
        stackBase.addArrangedSubview(buttonPay)
    }
    
    func buildConstraints() {
        stackBase.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.bottom.equalTo(view.safeArea.bottom).inset(30)
            make.leading.trailing.equalToSuperview().inset(25)
        }
        
        buttonPay.snp.makeConstraints { make in
            make.height.equalTo(40)
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
        return cartList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cartResuseIdentifier, for: indexPath) as! CartCollectionViewCell
        cell.configureCell(book: cartList[indexPath.row])
        return cell
    }
}

extension CartViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        return CGSize(width: width, height: 100)
    }
}
