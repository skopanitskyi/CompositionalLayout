//
//  ReusableCell.swift
//  CompositionalLayout
//
//  Created by Сергей Копаницкий on 07.02.2021.
//

import UIKit

private enum ReusableCellConstants {
    static let cellCornerRadiusDivisor: CGFloat = 10
    static let cellBorderWidth: CGFloat = 1
    
    static let productImageViewTopPadding: CGFloat = 25
    static let productImageViewLeadingPadding: CGFloat = 22
    static let productImageViewTrailingPadding: CGFloat = -22
    static let productImageViewHeight: CGFloat = 85
    
    static let productNameLabelTopPadding: CGFloat = 19
    static let productNameLabelLeadingPadding: CGFloat = 10
    static let productNameLabelTrailingPadding: CGFloat = -5
    static let productNameLabelHeight: CGFloat = 18
    static let productNameLabelFontSize: CGFloat = 16
    
    static let productDescriptionLabelTopPadding: CGFloat = 5
    static let productDescriptionLabelLeadingPadding: CGFloat = 10
    static let productDescriptionLabelTrailingPadding: CGFloat = -5
    static let productDescriptionLabelHeight: CGFloat = 15
    static let productDescriptionLabelFontSize: CGFloat = 14
    
    static let producePriceLabelLeadingPadding: CGFloat = 10
    static let producePriceLabelBottomPadding: CGFloat = -12
    static let producePriceLabelHeight: CGFloat = 18
    static let producePriceLabelFontSize: CGFloat = 18
    
    static let addProductButtonLeadingPadding: CGFloat = 5
    static let addProductButtonTrailingPadding: CGFloat = -14
    static let addProductButtonButtomPadding: CGFloat = -10
    static let addProductButtonHeight: CGFloat = 25
    static let addProductButtonWidth: CGFloat = 25
}

class ReusableCell: UICollectionViewCell {
    
    // MARK: - Create UI elements
    
    public let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = .gilroyBold(withSize: ReusableCellConstants.productNameLabelFontSize)
        return label
    }()
    
    public let productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .gilroyMedium(withSize: ReusableCellConstants.productDescriptionLabelFontSize)
        label.textColor = .productDescriptionTextColor
        return label
    }()
    
    public let producePriceLabel: UILabel = {
        let label = UILabel()
        label.font = .gilroyBold(withSize: ReusableCellConstants.producePriceLabelFontSize)
        return label
    }()
    
    private let addProductButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "button"), for: .normal)
        return button
    }()
    
    // MARK: - Constructors
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        seupSelf()
        setupProductImageView()
        setupProductNameLabel()
        setupProductDescriptionLabel()
        setupProductPriceLabel()
        setupAddProductButton()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Ovverides methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / ReusableCellConstants.cellCornerRadiusDivisor
    }
    
    // MARK: - Setup UI elements
    
    private func seupSelf() {
        layer.borderWidth = ReusableCellConstants.cellBorderWidth
        layer.borderColor = UIColor.defaultBorderBackground.cgColor
    }
    
    private func setupProductImageView() {
        addSubview(productImageView)
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.topAnchor.constraint(equalTo: topAnchor,
                                              constant: ReusableCellConstants.productImageViewTopPadding).isActive = true
        productImageView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                  constant: ReusableCellConstants.productImageViewLeadingPadding).isActive = true
        productImageView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                   constant: ReusableCellConstants.productImageViewTrailingPadding).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant: ReusableCellConstants.productImageViewHeight).isActive = true
    }
    
    private func setupProductNameLabel() {
        addSubview(productNameLabel)
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor,
                                              constant: ReusableCellConstants.productNameLabelTopPadding).isActive = true
        productNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                  constant: ReusableCellConstants.productNameLabelLeadingPadding).isActive = true
        productNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                   constant: ReusableCellConstants.productNameLabelTrailingPadding).isActive = true
        productNameLabel.heightAnchor.constraint(equalToConstant: ReusableCellConstants.productNameLabelHeight).isActive = true
    }
    
    private func setupProductDescriptionLabel() {
        addSubview(productDescriptionLabel)
        productDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        productDescriptionLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor,
                                                     constant: ReusableCellConstants.productDescriptionLabelTopPadding).isActive = true
        productDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                         constant: ReusableCellConstants.productDescriptionLabelLeadingPadding).isActive = true
        productDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                          constant: ReusableCellConstants.productDescriptionLabelTrailingPadding).isActive = true
        productDescriptionLabel.heightAnchor.constraint(equalToConstant: ReusableCellConstants.productDescriptionLabelHeight).isActive = true
    }
    
    private func setupProductPriceLabel() {
        addSubview(producePriceLabel)
        producePriceLabel.translatesAutoresizingMaskIntoConstraints = false
        producePriceLabel.heightAnchor.constraint(equalToConstant: ReusableCellConstants.producePriceLabelHeight).isActive = true
        producePriceLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                   constant: ReusableCellConstants.producePriceLabelLeadingPadding).isActive = true
        producePriceLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                  constant: ReusableCellConstants.producePriceLabelBottomPadding).isActive = true
    }
    
    private func setupAddProductButton() {
        addSubview(addProductButton)
        addProductButton.translatesAutoresizingMaskIntoConstraints = false
        addProductButton.leadingAnchor.constraint(equalTo: producePriceLabel.trailingAnchor,
                                                  constant: ReusableCellConstants.addProductButtonLeadingPadding).isActive = true
        addProductButton.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                   constant: ReusableCellConstants.addProductButtonTrailingPadding).isActive = true
        addProductButton.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                 constant: ReusableCellConstants.addProductButtonButtomPadding).isActive = true
        addProductButton.heightAnchor.constraint(equalToConstant: ReusableCellConstants.addProductButtonHeight).isActive = true
        addProductButton.widthAnchor.constraint(equalToConstant: ReusableCellConstants.addProductButtonWidth).isActive = true
    }
}
