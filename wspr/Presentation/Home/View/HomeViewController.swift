//
//  HomeViewController.swift
//  wspr
//
//  Created by Pinto Junior, William James on 25/01/22.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    // MARK: - Constantes
    let resuseIdentifier = "CollectionCell"
    let resuseIdentifierHorizontal = "CollectionCellHorizontal"
    
    // MARK: - Variables
    var categories: [Category] = []
    var books: [Book] = []
    fileprivate var viewModel: HomeViewModel = {
        return HomeViewModel()
    }()
    
    fileprivate var stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 25
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate var viewAux: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate var labelTitle: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Search For You"
        return label
    }()
    
    fileprivate var labelSubTitle: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Books Right Here"
        return label
    }()
    
    fileprivate var labelCategories: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Categories"
        return label
    }()
    
    fileprivate var textFieldSearch: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(red: 0.223, green: 0.243, blue: 0.274, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.attributedPlaceholder = NSAttributedString(string: "Search for a book", attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.textColor = .white
        return textField
    }()
    
    fileprivate var buttonSearch: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = UIColor(red: 0.992, green: 0.439, blue: 0.078, alpha: 1)
        button.backgroundColor = UIColor(red: 0.223, green: 0.243, blue: 0.274, alpha: 1)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    fileprivate var horrizontalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(red: 0.133, green: 0.156, blue: 0.192, alpha: 1)
        return collectionView
    }()
    
    fileprivate var verticalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(red: 0.133, green: 0.156, blue: 0.192, alpha: 1)
        return collectionView
    }()
    
    fileprivate func stackTitle() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(labelTitle)
        stack.addArrangedSubview(labelSubTitle)
        return stack
    }
    
    fileprivate func stackSearch() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(textFieldSearch)
        stack.addArrangedSubview(buttonSearch)
        return stack
    }
    
    fileprivate func stackCategories() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(labelCategories)
        stack.addArrangedSubview(horrizontalCollectionView)
        return stack
    }
    
    fileprivate func stackBook() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(verticalCollectionView)
        return stack
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.133, green: 0.156, blue: 0.192, alpha: 1)
        setupCollection()
        setupData()
        setupView()
    }
    
    // MARK: - Setup
    fileprivate func setupData() {
        categories = viewModel.getCategories()
        books = viewModel.getBooks()
    }
    
    fileprivate func setupCollection() {
        horrizontalCollectionView.dataSource = self
        horrizontalCollectionView.delegate = self
        horrizontalCollectionView.register(UINib(nibName: "HorizontalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: resuseIdentifierHorizontal)
        
        verticalCollectionView.dataSource = self
        verticalCollectionView.delegate = self
        verticalCollectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: resuseIdentifier)
    }
    
    // MARK: - Methods
    fileprivate let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        return layout
    }()
}

extension HomeViewController: CodeView {
    func buildHierarchy() {
        view.addSubview(stackBase)
        stackBase.addArrangedSubview(stackTitle())
        stackBase.addArrangedSubview(stackSearch())
        stackBase.addArrangedSubview(stackCategories())
        stackBase.addArrangedSubview(stackBook())
        stackBase.addArrangedSubview(viewAux)
    }
    
    func buildConstraints() {
        stackBase.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.bottom.equalTo(view.safeArea.bottom)
            make.leading.trailing.equalToSuperview().inset(25)
        }
        
        buttonSearch.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        horrizontalCollectionView.snp.makeConstraints { make in
            make.height.equalTo(45)
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if  collectionView == horrizontalCollectionView {
            return
        }
        
        let seeBookVC = SeeBookViewController()
        seeBookVC.book = books[indexPath.row]
        self.present(seeBookVC, animated: true, completion: nil)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if  collectionView == horrizontalCollectionView {
            return categories.count
        }
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == horrizontalCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resuseIdentifierHorizontal, for: indexPath) as! HorizontalCollectionViewCell
            cell.configureCell(text: categories[indexPath.row].title)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resuseIdentifier, for: indexPath) as! CustomCollectionViewCell
        cell.configureCell(text: books[indexPath.row].title, price: books[indexPath.row].price)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if  collectionView == horrizontalCollectionView {
            return CGSize(width: 80, height: 45)
        }
        let width = collectionView.bounds.width
        let numberOfItemsPerRow: CGFloat = 2
        let spacing: CGFloat = flowLayout.minimumInteritemSpacing
        let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
        let itemDimension = floor(availableWidth / numberOfItemsPerRow)
        return CGSize(width: itemDimension, height: itemDimension + 40)
    }
}
