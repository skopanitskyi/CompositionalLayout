//
//  GroceriesCell.swift
//  CompositionalLayout
//
//  Created by Сергей Копаницкий on 07.02.2021.
//

import UIKit

private enum GroceriesCellConstants {
    static let cellCornerRadiusDivisor: CGFloat = 10
    
    static let categoryImageViewHeight: CGFloat = 50
    static let categoryImageViewWidth: CGFloat = 50
    static let categoryImageViewLeadingPadding: CGFloat = 17
    
    static let categoryLabelHeight: CGFloat = 25
    static let categoryLabelLeadingPadding: CGFloat = 15
    static let categoryLabelTrailingPadding: CGFloat = -15
    static let categoryLabelFontSize: CGFloat = 20
}

class GroceriesCell: UICollectionViewCell {
    
    // MARK: - Create UI elements
    
    public let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .gilroyBold(withSize: GroceriesCellConstants.categoryLabelFontSize)
        return label
    }()
    
    // MARK: - Constructors
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCategoryImageView()
        setupCategoryLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Ovverides methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCornerRadius()
    }
    
    // MARK: - Setup UI elements
    
    private func setupCategoryImageView() {
        addSubview(categoryImageView)
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        categoryImageView.heightAnchor.constraint(equalToConstant: GroceriesCellConstants.categoryImageViewHeight).isActive = true
        categoryImageView.widthAnchor.constraint(equalToConstant: GroceriesCellConstants.categoryImageViewWidth).isActive = true
        categoryImageView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                   constant: GroceriesCellConstants.categoryImageViewLeadingPadding).isActive = true
        categoryImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setupCategoryLabel() {
        addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.heightAnchor.constraint(equalToConstant: GroceriesCellConstants.categoryLabelHeight).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: categoryImageView.trailingAnchor,
                                               constant: GroceriesCellConstants.categoryLabelLeadingPadding).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                constant: GroceriesCellConstants.categoryLabelTrailingPadding).isActive = true
        categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    // MARK: - Private methods
    
    private func setupCornerRadius() {
        layer.cornerRadius = frame.height / GroceriesCellConstants.cellCornerRadiusDivisor
    }
}
