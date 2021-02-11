//
//  BannerCell.swift
//  CompositionalLayout
//
//  Created by Сергей Копаницкий on 07.02.2021.
//

import UIKit

private enum BannerCellConstants {
    static let cellBorderWidth: CGFloat = 1
    static let cellCornerRadiusDivisor: CGFloat = 10
}

class BannerCell: UICollectionViewCell {
    
    // MARK: - Create UI elements
    
    public let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    // MARK: - Constructors
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSelf()
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overrides methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCornerRadius()
    }
    
    // MARK: - Setup UI elements
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    // MARK: - Private methods
    
    private func setupCornerRadius() {
        layer.cornerRadius = frame.height / BannerCellConstants.cellCornerRadiusDivisor
    }
    
    private func setupSelf() {
        layer.borderWidth = BannerCellConstants.cellBorderWidth
        layer.borderColor = UIColor.defaultBorderBackground.cgColor
    }
}
