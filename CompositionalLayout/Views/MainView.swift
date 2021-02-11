//
//  MainView.swift
//  CompositionalLayout
//
//  Created by Сергей Копаницкий on 06.02.2021.
//

import UIKit

private enum MainViewConstants {
    static let bannerSectionItemContentInsets = NSDirectionalEdgeInsets(top: 23.5, leading: 23.5, bottom: 23.5, trailing: 23.5)
    static let bannerSectionGroupHeight: CGFloat = 115
    
    static let exclusiveOfferSectionItemContentInsets = NSDirectionalEdgeInsets(top: 23.5, leading: 0, bottom: 23.5, trailing: 14)
    static let exclusiveOfferSectionContentInsets = NSDirectionalEdgeInsets(top: 0, leading: 23, bottom: 0, trailing: 23)
    static let exclusiveOfferSectionGroupHeight: CGFloat = 250
    
    static let bestSellingSectionItemContentInsets = NSDirectionalEdgeInsets(top: 23.5, leading: 0, bottom: 23.5, trailing: 14)
    static let bestSellingSectionContentInsets = NSDirectionalEdgeInsets(top: 0, leading: 23, bottom: 0, trailing: 23)
    static let bestSellingSectionGroupHeight: CGFloat = 250
    
    static let groceriesSectionContentInsets = NSDirectionalEdgeInsets(top: 23.5, leading: 23.5, bottom: 23.5, trailing: 23.5)
    static let groceriesSectionGroupHeight: CGFloat = 105
    
    static let categoriesSectionItemContentInsets = NSDirectionalEdgeInsets(top: 23.5, leading: 23.5, bottom: 23.5, trailing: 23.5)
    static let categoriesSectionGroupHeight: CGFloat = 190
    static let categoriesSectionGroupItemsCount = 2
}

class MainView: UIView {
    
    // MARK: - Create UI elements
    
    public lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: compositionalLayout())
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: Private constants
    
    private let sectionType: (Int) -> Sections?
    
    // MARK: - Constructors
    
    init(sectionType: @escaping (Int) -> Sections?) {
        self.sectionType = sectionType
        super.init(frame: .zero)
        setupSelf()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI elements
    
    private func setupCollectionView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    // MARK: - Private methods
    
    private func setupSelf() {
        backgroundColor = .white
    }
}

// MARK: - Compositional layout

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
        item.contentInsets = MainViewConstants.bannerSectionItemContentInsets
        let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                     heightDimension: .absolute(MainViewConstants.bannerSectionGroupHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayoutSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        return section
    }
    
    private func exclusiveOfferSectionLayout() -> NSCollectionLayoutSection {
        let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemLayoutSize)
        item.contentInsets = MainViewConstants.exclusiveOfferSectionItemContentInsets
        let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.45),
                                                     heightDimension: .absolute(MainViewConstants.exclusiveOfferSectionGroupHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayoutSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = MainViewConstants.exclusiveOfferSectionContentInsets
        return section
    }
    
    private func bestSellingSectionLayout() -> NSCollectionLayoutSection {
        let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemLayoutSize)
        item.contentInsets = MainViewConstants.bestSellingSectionItemContentInsets
        let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.45),
                                                     heightDimension: .absolute(MainViewConstants.bestSellingSectionGroupHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayoutSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = MainViewConstants.bestSellingSectionContentInsets
        return section
    }
    
    private func groceriesSectionLayout() -> NSCollectionLayoutSection {
        let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemLayoutSize)
        item.contentInsets = MainViewConstants.groceriesSectionContentInsets
        let gropLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7),
                                                    heightDimension: .absolute(MainViewConstants.groceriesSectionGroupHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: gropLayoutSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func categoriesSectionLayout() -> NSCollectionLayoutSection {
        let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemLayoutSize)
        item.contentInsets = MainViewConstants.categoriesSectionItemContentInsets
        let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                     heightDimension: .absolute(MainViewConstants.categoriesSectionGroupHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayoutSize, subitem: item,
                                                       count: MainViewConstants.categoriesSectionGroupItemsCount)
        return NSCollectionLayoutSection(group: group)
    }
}
