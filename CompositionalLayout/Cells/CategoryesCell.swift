//
//  CategoryesCell.swift
//  CompositionalLayout
//
//  Created by Сергей Копаницкий on 07.02.2021.
//

import UIKit

class CategoryesCell: UICollectionViewCell {
    
    public let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    public let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Gilroy-Bold", size: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCategoryImageView()
        setupCategoryLabel()
        layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 10
    }
    
    private func setupCategoryImageView() {
        addSubview(categoryImageView)
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        categoryImageView.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        categoryImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        categoryImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        categoryImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func setupCategoryLabel() {
        addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: 5).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10).isActive = true
    }
}
