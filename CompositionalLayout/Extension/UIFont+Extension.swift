//
//  UIFont+Extension.swift
//  CompositionalLayout
//
//  Created by Сергей Копаницкий on 09.02.2021.
//

import UIKit

extension UIFont {
    
    public static func gilroyBold(withSize size: CGFloat) -> UIFont? {
        return UIFont(name: "Gilroy-Bold", size: size)
    }
    
    public static func gilroyMedium(withSize size: CGFloat) -> UIFont? {
        return UIFont(name: "Gilroy-Medium", size: size)
    }
    
    public static func gilroy(withSize size: CGFloat) -> UIFont? {
        return UIFont(name: "Gilroy-Regular", size: size)
    }
}
