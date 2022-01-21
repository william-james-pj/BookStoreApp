//
//  ProfileViewController.swift
//  wspr
//
//  Created by Pinto Junior, William James on 20/01/22.
//

import UIKit

class ProfileViewController: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var collectionViewOptions: UICollectionView!
    
    // MARK: - Variables
    fileprivate var viewModel: ProfileViewModel = {
        return ProfileViewModel()
    }()
    
    // MARK: - Constants
    let resuseIdentifier = "collectionCellOptions"
    var options: [Option] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupCollection()
    }

    // MARK: - Setup
    fileprivate func setupData() {
        options = viewModel.getOptions()
    }
    
    fileprivate func setupCollection() {
        self.collectionViewOptions.register(UINib(nibName: "OptionsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: resuseIdentifier)
        
        collectionViewOptions.delegate = self
        collectionViewOptions.dataSource = self
    }
    
    fileprivate let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        return layout
    }()
}

extension ProfileViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resuseIdentifier, for: indexPath) as! OptionsCollectionViewCell
        cell.configureCell(title: options[indexPath.row].title, subTitle: options[indexPath.row].subTitle, image: options[indexPath.row].icon)
        return cell
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let numberOfItemsPerRow: CGFloat = 1
        let spacing: CGFloat = flowLayout.minimumInteritemSpacing
        let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
        let itemDimension = floor(availableWidth / numberOfItemsPerRow)
        return CGSize(width: itemDimension, height: 60)
    }
}
