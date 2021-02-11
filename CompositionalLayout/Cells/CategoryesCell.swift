//
//  CategoryesCell.swift
//  CompositionalLayout
//
//  Created by Сергей Копаницкий on 07.02.2021.
//

import UIKit

private enum CategoryesCellConstants {
    static let cellCornerRadiusDivisor: CGFloat = 10
    static let cellBorderWidth: CGFloat = 1
    
    static let categoryImageViewTopPadding: CGFloat = 30
    static let categoryImageViewHeight: CGFloat = 50
    static let categoryImageViewWidth: CGFloat = 50
    
    static let categoryLabelTopPadding: CGFloat = 5
    static let categoryLabelLeadingPadding: CGFloat = 10
    static let categoryLabelTrailingPadding: CGFloat = -10
    static let categoryLabelBottomPadding: CGFloat = 10
    static let categoryLabelFontSize: CGFloat = 20
    static let categoryLabelNumberOfLines = 0
}

class CategoryesCell: UICollectionViewCell {
    
    // MARK: - Create UI elements
    
    public let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    public let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .gilroyBold(withSize: CategoryesCellConstants.categoryLabelFontSize)
        label.textAlignment = .center
        label.numberOfLines = CategoryesCellConstants.categoryLabelNumberOfLines
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
    
    // MARK: - Overrides methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupSelf()
    }
    
    // MARK: - Setup UI elements
    
    private func setupCategoryImageView() {
        addSubview(categoryImageView)
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        categoryImageView.topAnchor.constraint(equalTo: topAnchor,
                                               constant: CategoryesCellConstants.categoryImageViewTopPadding).isActive = true
        categoryImageView.heightAnchor.constraint(equalToConstant: CategoryesCellConstants.categoryImageViewHeight).isActive = true
        categoryImageView.widthAnchor.constraint(equalToConstant: CategoryesCellConstants.categoryImageViewWidth).isActive = true
        categoryImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func setupCategoryLabel() {
        addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor,
                                           constant: CategoryesCellConstants.categoryLabelTopPadding).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                               constant: CategoryesCellConstants.categoryLabelLeadingPadding).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                constant: CategoryesCellConstants.categoryLabelTrailingPadding).isActive = true
        categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                              constant: CategoryesCellConstants.categoryLabelBottomPadding).isActive = true
    }
    
    // MARK: - Private methods
    
    private func setupSelf() {
        layer.cornerRadius = frame.height / CategoryesCellConstants.cellCornerRadiusDivisor
        layer.borderWidth = CategoryesCellConstants.cellBorderWidth
    }
}
