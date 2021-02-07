//
//  MainController.swift
//  CompositionalLayout
//
//  Created by Сергей Копаницкий on 06.02.2021.
//

import UIKit

private enum MainControllerConstants {
    static let numberOfSections = 5
    static let cellId = "cell"
    static let bannerId = "bannerId"
    static let reusableId = "reusableId"
    static let reusableId2 = "reusableId2"
    static let groceriesId = "groceriesId"
    static let categoryId = "categoryId"
}

private enum Sections {
    case banner(UIImage)
    case exclusiveOffer(image: UIImage, productName: String, price: String, quantity: String)
    case bestSelling(image: UIImage, productName: String, price: String, quantity: String)
    case groceries(image: UIImage, name: String, backgroundColor: UIColor)
    case categories(image: UIImage, name: String, backgroundColor: UIColor, borderBackgroundColor: UIColor)
}

protocol MainControllerOutput: class {
    
}

class MainController: UIViewController {
    
    public weak var output: MainControllerOutput?
    
    private let mainView = MainView()
    
    private static let dataSource = [[Sections.banner(#imageLiteral(resourceName: "banner")),
                                      Sections.banner(#imageLiteral(resourceName: "banner")),
                                      Sections.banner(#imageLiteral(resourceName: "banner"))],
                                     [Sections.exclusiveOffer(image: #imageLiteral(resourceName: "apple"),
                                                              productName: "Red Apple",
                                                              price: "$4.99",
                                                              quantity: "1kg"),
                                      Sections.exclusiveOffer(image: #imageLiteral(resourceName: "egg"),
                                                              productName: "Egg Chicken White",
                                                              price: "$1.5",
                                                              quantity: "10pcs"),
                                      Sections.exclusiveOffer(image: #imageLiteral(resourceName: "pasta"),
                                                              productName: "Pasta",
                                                              price: "$15.99",
                                                              quantity: "700g"),
                                      Sections.exclusiveOffer(image: #imageLiteral(resourceName: "coke"),
                                                              productName: "Diet Coke",
                                                              price: "$1.99",
                                                              quantity: "355ml"),
                                      Sections.exclusiveOffer(image: #imageLiteral(resourceName: "sprite"),
                                                              productName: "Sprite Can",
                                                              price: "$1.50",
                                                              quantity: "325ml")],
                                     [Sections.bestSelling(image: #imageLiteral(resourceName: "ginger"),
                                                          productName: "Ginger",
                                                          price: "$4.99",
                                                          quantity: "250g"),
                                      Sections.bestSelling(image: #imageLiteral(resourceName: "paper"),
                                                           productName: "Bell Pepper Red",
                                                           price: "$4.99",
                                                           quantity: "1kg"),
                                      Sections.bestSelling(image: #imageLiteral(resourceName: "juice"),
                                                           productName: "Orenge Juice",
                                                           price: "$15.99",
                                                           quantity: "2L"),
                                      Sections.bestSelling(image: #imageLiteral(resourceName: "pepsi"),
                                                           productName: "Pepsi Can",
                                                           price: "$4.99",
                                                           quantity: "330ml")],
                                     [Sections.groceries(image: #imageLiteral(resourceName: "pulses"),
                                                         name: "Pulses",
                                                         backgroundColor: .pulsesBackgroundColor),
                                      Sections.groceries(image: #imageLiteral(resourceName: "rice"),
                                                          name: "Rice",
                                                          backgroundColor: .riceBackgroundColor),
                                      Sections.groceries(image: #imageLiteral(resourceName: "pulses"),
                                                          name: "Pulses",
                                                          backgroundColor: .pulsesBackgroundColor),
                                      Sections.groceries(image: #imageLiteral(resourceName: "rice"),
                                                          name: "Rice",
                                                          backgroundColor: .riceBackgroundColor)],
                                     [Sections.categories(image: #imageLiteral(resourceName: "vegetable"),
                                                          name: "Frash Fruits & Vegetable",
                                                          backgroundColor: .fruitsBackgroundColor,
                                                          borderBackgroundColor: .fruitsBorderBackgroundColor),
                                      Sections.categories(image: #imageLiteral(resourceName: "oil"),
                                                           name: "Cooking Oil & Ghee",
                                                           backgroundColor: .oilBackgroundColor,
                                                           borderBackgroundColor: .oilBorderBackgroundColor),
                                      Sections.categories(image: #imageLiteral(resourceName: "fish"),
                                                           name: "Meat & Fish",
                                                           backgroundColor: .meatBackgroundColor,
                                                           borderBackgroundColor: .meatBorderBackgroundColor),
                                      Sections.categories(image: #imageLiteral(resourceName: "snacks"),
                                                           name: "Bakery & Snacks",
                                                           backgroundColor: .bakeryBackgroundColor,
                                                           borderBackgroundColor: .bakeryBorderBackgroundColor),
                                      Sections.categories(image: #imageLiteral(resourceName: "dairy"),
                                                           name: "Dairy & Eggs",
                                                           backgroundColor: .dairyBackgroundColor,
                                                           borderBackgroundColor: .dairyBorderBackgroundColor),
                                      Sections.categories(image: #imageLiteral(resourceName: "beverages"),
                                                           name: "Beverages",
                                                           backgroundColor: .beveragesBackgroundColor,
                                                           borderBackgroundColor: .beveragesBorderBackgroundColor),
                                      Sections.categories(image: #imageLiteral(resourceName: "vegetable"),
                                                           name: "Dairy & Eggs",
                                                           backgroundColor: .eggsBackgroundColor,
                                                           borderBackgroundColor: .eggsBorderBackgroundColor),
                                      Sections.categories(image: #imageLiteral(resourceName: "vegetable"),
                                                           name: "Beverages",
                                                           backgroundColor: .drinksBackgroundColor,
                                                           borderBackgroundColor: .drinksBorderBackgroundColor)]]
    
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
                return groceriesSectionLayout()
            case .categories:
                return categoriesSectionLayout()
            }
        }
    }
    
    private static func bannerSectionLayout() -> NSCollectionLayoutSection {
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
    
    private static func exclusiveOfferSectionLayout() -> NSCollectionLayoutSection {
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
    
    private static func bestSellingSectionLayout() -> NSCollectionLayoutSection {
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
    
    private static func groceriesSectionLayout() -> NSCollectionLayoutSection {
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
    
    private static func categoriesSectionLayout() -> NSCollectionLayoutSection {
        let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemLayoutSize)
        item.contentInsets = .init(top: 23.5, leading: 23.5, bottom: 23.5, trailing: 23.5)
        let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(190))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayoutSize, subitem: item, count: 2)
        return NSCollectionLayoutSection(group: group)
    }
    
    private func setupSelf() {
        mainView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: MainControllerConstants.cellId)
        mainView.collectionView.register(BannerCell.self, forCellWithReuseIdentifier: MainControllerConstants.bannerId)
        mainView.collectionView.register(ReusableCell.self, forCellWithReuseIdentifier: MainControllerConstants.reusableId)
        mainView.collectionView.register(ReusableCell.self, forCellWithReuseIdentifier: MainControllerConstants.reusableId2)
        mainView.collectionView.register(GroceriesCell.self, forCellWithReuseIdentifier: MainControllerConstants.groceriesId)
        mainView.collectionView.register(CategoryesCell.self, forCellWithReuseIdentifier: MainControllerConstants.categoryId)
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
        let data = MainController.dataSource[indexPath.section][indexPath.row]
        
        switch data {
        case .banner(let image):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainControllerConstants.bannerId,
                                                          for: indexPath) as? BannerCell else { return UICollectionViewCell() }
            cell.imageView.image = image
            return cell
        case .exclusiveOffer(let image, let productName, let price, let quantity):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainControllerConstants.reusableId,
                                                          for: indexPath) as? ReusableCell else { return UICollectionViewCell() }
            cell.productImageView.image = image
            cell.productNameLabel.text = productName
            cell.productDescriptionLabel.text = "\(quantity), Price"
            cell.producePriceLabel.text = price
            return cell
        case .bestSelling(let image, let productName, let price, let quantity):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainControllerConstants.reusableId2,
                                                          for: indexPath) as? ReusableCell else { return UICollectionViewCell() }
            cell.productImageView.image = image
            cell.productNameLabel.text = productName
            cell.productDescriptionLabel.text = "\(quantity), Price"
            cell.producePriceLabel.text = price
            return cell
        case .groceries(let image, let name, let backgroundColor):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainControllerConstants.groceriesId,
                                                          for: indexPath) as? GroceriesCell else { return UICollectionViewCell() }
            cell.categoryImageView.image = image
            cell.categoryLabel.text = name
            cell.backgroundColor = backgroundColor
            return cell
        case .categories(let image, let name, let backgroundColor, let borderBackgroundColor):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainControllerConstants.categoryId,
                                                          for: indexPath) as? CategoryesCell else { return UICollectionViewCell() }
            cell.categoryImageView.image = image
            cell.categoryLabel.text = name
            cell.backgroundColor = backgroundColor
            cell.layer.borderColor = borderBackgroundColor.cgColor
            return cell
        }
    }
}
