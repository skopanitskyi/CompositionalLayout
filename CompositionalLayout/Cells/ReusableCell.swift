//
//  ReusableCell.swift
//  CompositionalLayout
//
//  Created by Сергей Копаницкий on 07.02.2021.
//

import UIKit

class ReusableCell: UICollectionViewCell {
    
    public let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Gilroy-Bold", size: 16)
        return label
    }()
    
    public let productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Gilroy-Medium", size: 14)
        label.textColor = UIColor(red: 124/255, green: 124/255, blue: 123/255, alpha: 1)
        return label
    }()
    
    public let producePriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Gilroy-Bold", size: 18)
        return label
    }()
    
    private let addProductButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "button"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProductImageView()
        setupProductNameLabel()
        setupProductDescriptionLabel()
        setupProductPriceLabel()
        setupAddProductButton()
        layer.borderWidth = 1
        layer.borderColor = CGColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 10
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProductImageView() {
        addSubview(productImageView)
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.topAnchor.constraint(equalTo: topAnchor, constant: 25).isActive = true
        productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22).isActive = true
        productImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant: 85).isActive = true
    }
    
    private func setupProductNameLabel() {
        addSubview(productNameLabel)
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 19).isActive = true
        productNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        productNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        productNameLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
    
    private func setupProductDescriptionLabel() {
        addSubview(productDescriptionLabel)
        productDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        productDescriptionLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 5).isActive = true
        productDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        productDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        productDescriptionLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    private func setupProductPriceLabel() {
        addSubview(producePriceLabel)
        producePriceLabel.translatesAutoresizingMaskIntoConstraints = false
        producePriceLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        producePriceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        producePriceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
    }
    
    private func setupAddProductButton() {
        addSubview(addProductButton)
        addProductButton.translatesAutoresizingMaskIntoConstraints = false
        addProductButton.leadingAnchor.constraint(equalTo: producePriceLabel.trailingAnchor, constant: 5).isActive = true
        addProductButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14).isActive = true
        addProductButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        addProductButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        addProductButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
}
