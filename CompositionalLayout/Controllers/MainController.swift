//
//  MainController.swift
//  CompositionalLayout
//
//  Created by Сергей Копаницкий on 06.02.2021.
//

import UIKit

private enum MainControllerConstants {
    static let bannerId = "bannerId"
    static let reusableId = "reusableId"
    static let groceriesId = "groceriesId"
    static let categoryId = "categoryId"
}

public enum Sections {
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
    
    private lazy var mainView = MainView(sectionType: getSection(for:))
    
    private let dataSource = [[Sections.banner(#imageLiteral(resourceName: "banner")),
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
    
    private func setupSelf() {
        mainView.collectionView.register(BannerCell.self, forCellWithReuseIdentifier: MainControllerConstants.bannerId)
        mainView.collectionView.register(ReusableCell.self, forCellWithReuseIdentifier: MainControllerConstants.reusableId)
        mainView.collectionView.register(GroceriesCell.self, forCellWithReuseIdentifier: MainControllerConstants.groceriesId)
        mainView.collectionView.register(CategoryesCell.self, forCellWithReuseIdentifier: MainControllerConstants.categoryId)
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
    
    private func getSection(for sectionIndex: Int) -> Sections? {
        guard dataSource.indices.contains(sectionIndex) else { return nil }
        return dataSource[sectionIndex].first
    }
}

extension MainController: UICollectionViewDelegate {
    
}

extension MainController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = dataSource[indexPath.section][indexPath.row]
        
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
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainControllerConstants.reusableId,
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
