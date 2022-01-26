//
//  SeeBookViewController.swift
//  wspr
//
//  Created by Pinto Junior, William James on 24/01/22.
//

import UIKit

class SeeBookViewController: UIViewController {
    // MARK: - Variables
    var book: Book?
    
    fileprivate var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    fileprivate var viewBase: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 35
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate var imageView: UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 15
        img.clipsToBounds = true
        return img
    }()
    
    fileprivate var imagemBookmark: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "bookmark")
        img.tintColor = .gray
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    fileprivate var labelTitle: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    fileprivate var labelPrice: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red: 0.992, green: 0.439, blue: 0.078, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate var labelDescription: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate var labelTextDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate var buttonPurchase: UIButton = {
       let button = UIButton()
        button.setTitle("Purchse Now", for: .normal)
        button.backgroundColor = UIColor(red: 0.223, green: 0.243, blue: 0.274, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPurchasePressed), for: .touchDown)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    fileprivate func stackHeader() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(stackTitle())
        stack.addArrangedSubview(labelPrice)
        return stack
    }
    
    fileprivate func stackTitle() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(labelTitle)
        stack.addArrangedSubview(imagemBookmark)
        return stack
    }
    
    fileprivate func stackDescription() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(labelDescription)
        stack.addArrangedSubview(labelTextDescription)
        return stack
    }
    
    // MARK: - Action
    @objc fileprivate func buttonPurchasePressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.133, green: 0.156, blue: 0.192, alpha: 1)
        setupData()
        setupView()
    }
    
    // MARK: - Setup
    fileprivate func setupData() {
        labelTitle.text = book?.title
        labelPrice.text = "$\(book?.price ?? 0)"
        labelTextDescription.text = book?.description
        imageView.image = book?.image
    }
}

extension SeeBookViewController: CodeView {
    func buildHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(viewBase)
        viewBase.addSubview(stack)
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(stackHeader())
        stack.addArrangedSubview(stackDescription())
        stack.addArrangedSubview(buttonPurchase)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            viewBase.topAnchor.constraint(equalTo: scrollView.topAnchor),
            viewBase.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            viewBase.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            viewBase.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            viewBase.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            stack.topAnchor.constraint(equalTo: viewBase.topAnchor, constant: 25),
            stack.leadingAnchor.constraint(equalTo: viewBase.leadingAnchor, constant: 25),
            stack.trailingAnchor.constraint(equalTo: viewBase.trailingAnchor, constant: -25),
            stack.bottomAnchor.constraint(equalTo: viewBase.bottomAnchor, constant: -25),
            
            buttonPurchase.heightAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 350),
            
            imagemBookmark.heightAnchor.constraint(equalToConstant: 25),
            imagemBookmark.widthAnchor.constraint(equalToConstant: 25),
        ])
    }
}
