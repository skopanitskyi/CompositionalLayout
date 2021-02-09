//
//  GroceriesCell.swift
//  CompositionalLayout
//
//  Created by Сергей Копаницкий on 07.02.2021.
//

import UIKit

class GroceriesCell: UICollectionViewCell {
    
    public let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .gilroyBold(withSize: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCategoryImageView()
        setupCategoryLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCornerRadius()
    }
    
    private func setupCategoryImageView() {
        addSubview(categoryImageView)
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        categoryImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        categoryImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        categoryImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        categoryImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17).isActive = true
    }
    
    private func setupCategoryLabel() {
        addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: categoryImageView.trailingAnchor, constant: 15).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
    }
    
    private func setupCornerRadius() {
        layer.cornerRadius = frame.height / 10
    }
}
