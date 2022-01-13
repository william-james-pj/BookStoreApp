//
//  CollectionViewController.swift
//  wspr
//
//  Created by Pinto Junior, William James on 13/01/22.
//

import UIKit

class CollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let resuseIdentifier = "CollectionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
    }
    
    fileprivate func setupCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resuseIdentifier, for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    
}
