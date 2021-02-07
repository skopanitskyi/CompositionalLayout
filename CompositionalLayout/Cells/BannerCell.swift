//
//  BannerCell.swift
//  CompositionalLayout
//
//  Created by Сергей Копаницкий on 07.02.2021.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    public let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
        layer.borderWidth = 1
        layer.borderColor = CGColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCornerRadius()
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func setupCornerRadius() {
        layer.cornerRadius = frame.height / 10
    }
}
