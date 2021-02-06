//
//  MainController.swift
//  CompositionalLayout
//
//  Created by Сергей Копаницкий on 06.02.2021.
//

import UIKit

private enum MainControllerConstants {
    static let numberOfSections = 6
}

private enum Sections {
    case banner(UIImage)
    case exclusiveOffer(title: String, image: UIImage, productName: String, price: String, quantity: String)
    case bestSelling(title: String, image: UIImage, productName: String, price: String, quantity: String)
    case groceries(title: String, image: UIImage, name: String, backgroundColor: UIColor)
    case categories(title: String, image: UIImage, name: String, backgroundColor: UIColor)
}

protocol MainControllerOutput: class {
    
}

class MainController: UIViewController {
    
    public weak var output: MainControllerOutput?
    
    private let mainView = MainView()
    
    private static let dataSource: [[Sections]] = [[Sections.banner(#imageLiteral(resourceName: "banner")), Sections.banner(#imageLiteral(resourceName: "banner")), Sections.banner(#imageLiteral(resourceName: "banner"))]]
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelf()
    }
    
    public static func compositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { section, _ -> NSCollectionLayoutSection? in
            guard let sectionLayout = dataSource[section].first else { return nil }
            
            switch sectionLayout {
            case .banner:
                return bannerSectionLayout()
            case .exclusiveOffer:
                return exclusiveOfferSectionLayout()
            case .bestSelling:
                return bestSellingSectionLayout()
            case .groceries:
                return nil
            case .categories:
                return nil
            }
        }
    }
    
    private static func bannerSectionLayout() -> NSCollectionLayoutSection {
        let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemLayoutSize)
        let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(115))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayoutSize, subitems: [item])
        return NSCollectionLayoutSection(group: group)
    }
    
    private static func exclusiveOfferSectionLayout() -> NSCollectionLayoutSection {
        let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemLayoutSize)
        let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.45), heightDimension: .absolute(250))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayoutSize, subitems: [item])
        return NSCollectionLayoutSection(group: group)
    }
    
    private static func bestSellingSectionLayout() -> NSCollectionLayoutSection {
        let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemLayoutSize)
        let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.45), heightDimension: .absolute(250))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayoutSize, subitems: [item])
        return NSCollectionLayoutSection(group: group)
    }
    
    private func setupSelf() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
}

extension MainController: UICollectionViewDelegate {
    
}

extension MainController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return MainControllerConstants.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MainController.dataSource[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
