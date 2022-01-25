//
//  NewProfileViewController.swift
//  wspr
//
//  Created by Pinto Junior, William James on 25/01/22.
//

import UIKit
import SnapKit

class NewProfileViewController: UIViewController {
    // MARK: - Constantes
    let imageSize = 90
    let resuseIdentifier = "collectionCellOptions"
    
    // MARK: - Variables
    var options: [Option] = []
    fileprivate var viewModel: ProfileViewModel = {
        return ProfileViewModel()
    }()
    
    fileprivate var stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 40
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate var labelName: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "William James"
        return label
    }()
    
    fileprivate var labelEmail: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "wspr@gft.com"
        return label
    }()
    
    fileprivate var imageProfile: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "mi")
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    fileprivate var buttonEditProfile: UIButton = {
       let button = UIButton()
        button.setTitle("Edit Profile", for: .normal)
        button.backgroundColor = UIColor(red: 0.223, green: 0.243, blue: 0.274, alpha: 1)
        button.setTitleColor(UIColor(red: 0.992, green: 0.439, blue: 0.078, alpha: 1), for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    fileprivate var optionsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(red: 0.133, green: 0.156, blue: 0.192, alpha: 1)
        return collectionView
    }()
    
    fileprivate func stackHeader() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 15
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(imageProfile)
        stack.addArrangedSubview(stackHeaderRight())
        return stack
    }
    
    fileprivate func stackHeaderRight() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 15
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(stackText())
        stack.addArrangedSubview(buttonEditProfile)
        return stack
    }
    
    fileprivate func stackText() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 3
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(labelName)
        stack.addArrangedSubview(labelEmail)
        return stack
    }
    
    fileprivate func stackOptions() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(optionsCollectionView)
        return stack
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.133, green: 0.156, blue: 0.192, alpha: 1)
        imageProfile.layer.cornerRadius = CGFloat(imageSize / 2)
        setupData()
        setupCollection()
        setupView()
    }
    
    // MARK: - Setup
    fileprivate func setupData() {
        options = viewModel.getOptions()
    }
    
    fileprivate func setupCollection() {
        optionsCollectionView.dataSource = self
        optionsCollectionView.delegate = self
        optionsCollectionView.register(UINib(nibName: "OptionsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: resuseIdentifier)
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

extension NewProfileViewController: CodeView {
    func buildHierarchy() {
        view.addSubview(stackBase)
        stackBase.addArrangedSubview(stackHeader())
        stackBase.addArrangedSubview(stackOptions())
    }
    
    func buildConstraints() {
        stackBase.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.bottom.equalTo(view.safeArea.bottom)
            make.leading.trailing.equalToSuperview().inset(25)
        }
        
        imageProfile.snp.makeConstraints { make in
            make.height.equalTo(90)
            make.width.equalTo(90)
        }
    }
}

extension NewProfileViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension NewProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resuseIdentifier, for: indexPath) as! OptionsCollectionViewCell
        cell.configureCell(title: options[indexPath.row].title, subTitle: options[indexPath.row].subTitle, image: options[indexPath.row].icon)
        return cell
    }
}

extension NewProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let numberOfItemsPerRow: CGFloat = 1
        let spacing: CGFloat = flowLayout.minimumInteritemSpacing
        let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
        let itemDimension = floor(availableWidth / numberOfItemsPerRow)
        return CGSize(width: itemDimension, height: 60)
    }
}
