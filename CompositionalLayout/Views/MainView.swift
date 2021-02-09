//
//  MainView.swift
//  CompositionalLayout
//
//  Created by Сергей Копаницкий on 06.02.2021.
//

import UIKit

class MainView: UIView {
    
    public lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: compositionalLayout())
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let sectionType: (Int) -> Sections?
    
    init(sectionType: @escaping (Int) -> Sections?) {
        self.sectionType = sectionType
        super.init(frame: .zero)
        setupSelf()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSelf() {
        backgroundColor = .white
    }
    
    private func setupCollectionView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

extension MainView {
    
    public func compositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ -> NSCollectionLayoutSection? in
            guard let sectionLayout = self?.sectionType(sectionIndex) else { return nil }
            
            switch sectionLayout {
            case .banner:
                return self?.bannerSectionLayout()
            case .exclusiveOffer:
                return self?.exclusiveOfferSectionLayout()
            case .bestSelling:
                return self?.bestSellingSectionLayout()
            case .groceries:
                return self?.groceriesSectionLayout()
            case .categories:
                return self?.categoriesSectionLayout()
            }
        }
    }
    
    private func bannerSectionLayout() -> NSCollectionLayoutSection {
        let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemLayoutSize)
        item.contentInsets = .init(top: 23.5, leading: 23.5, bottom: 23.5, trailing: 23.5)
        let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(115))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayoutSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        return section
    }
    
    private func exclusiveOfferSectionLayout() -> NSCollectionLayoutSection {
        let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemLayoutSize)
        item.contentInsets = .init(top: 23.5, leading: 0, bottom: 23.5, trailing: 14)
        let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.45), heightDimension: .absolute(250))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayoutSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 0, leading: 23, bottom: 0, trailing: 23)
        return section
    }
    
    private func bestSellingSectionLayout() -> NSCollectionLayoutSection {
        let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemLayoutSize)
        item.contentInsets = .init(top: 23.5, leading: 0, bottom: 23.5, trailing: 14)
        let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.45), heightDimension: .absolute(250))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayoutSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 0, leading: 23, bottom: 0, trailing: 23)
        return section
    }
    
    private func groceriesSectionLayout() -> NSCollectionLayoutSection {
        let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemLayoutSize)
        item.contentInsets = .init(top: 23.5, leading: 23.5, bottom: 23.5, trailing: 23.5)
        let gropLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .absolute(105))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: gropLayoutSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func categoriesSectionLayout() -> NSCollectionLayoutSection {
        let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemLayoutSize)
        item.contentInsets = .init(top: 23.5, leading: 23.5, bottom: 23.5, trailing: 23.5)
        let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(190))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayoutSize, subitem: item, count: 2)
        return NSCollectionLayoutSection(group: group)
    }
}
