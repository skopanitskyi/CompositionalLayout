//
//  UIColor+Extension.swift
//  CompositionalLayout
//
//  Created by Сергей Копаницкий on 07.02.2021.
//

import UIKit

extension UIColor {
    
    private static func getColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    public static var defaultBorderBackground: UIColor {
        return .getColor(red: 226, green: 226, blue: 226)
    }
    
    public static var pulsesBackgroundColor: UIColor {
        return .getColor(red: 248, green: 164, blue: 76, alpha: 0.15)
    }
    
    public static var riceBackgroundColor: UIColor {
        return .getColor(red: 83, green: 177, blue: 117, alpha: 0.15)
    }
    
    public static var fruitsBackgroundColor: UIColor {
        return .getColor(red: 83, green: 177, blue: 117, alpha: 0.1)
    }
    
    public static var fruitsBorderBackgroundColor: UIColor {
        return .getColor(red: 83, green: 177, blue: 117, alpha: 0.7)
    }
    
    public static var oilBackgroundColor: UIColor {
        return .getColor(red: 248, green: 164, blue: 76, alpha: 0.1)
    }
    
    public static var oilBorderBackgroundColor: UIColor {
        return .getColor(red: 248, green: 164, blue: 76, alpha: 0.7)
    }
    
    public static var meatBackgroundColor: UIColor {
        return .getColor(red: 247, green: 165, blue: 147, alpha: 0.25)
    }
    
    public static var meatBorderBackgroundColor: UIColor {
        return .getColor(red: 247, green: 165, blue: 147)
    }
    
    public static var bakeryBackgroundColor: UIColor {
        return .getColor(red: 211, green: 176, blue: 224, alpha: 0.25)
    }
    
    public static var bakeryBorderBackgroundColor: UIColor {
        return .getColor(red: 211, green: 176, blue: 244)
    }
    
    public static var dairyBackgroundColor: UIColor {
        return .getColor(red: 253, green: 229, blue: 152, alpha: 0.25)
    }
    
    public static var dairyBorderBackgroundColor: UIColor {
        return .getColor(red: 253, green: 229, blue: 152)
    }
    
    public static var beveragesBackgroundColor: UIColor {
        return .getColor(red: 183, green: 223, blue: 245, alpha: 0.25)
    }
    
    public static var beveragesBorderBackgroundColor: UIColor {
        return .getColor(red: 183, green: 223, blue: 245)
    }
    
    public static var eggsBackgroundColor: UIColor {
        return .getColor(red: 131, green: 106, blue: 246, alpha: 0.15)
    }
    
    public static var eggsBorderBackgroundColor: UIColor {
        return .getColor(red: 131, green: 106, blue: 246, alpha: 0.5)
    }
    
    public static var drinksBackgroundColor: UIColor {
        return .getColor(red: 215, green: 59, blue: 119, alpha: 0.15)
    }
    
    public static var drinksBorderBackgroundColor: UIColor {
        return .getColor(red: 215, green: 59, blue: 119, alpha: 0.5)
    }
}
