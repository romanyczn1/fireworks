//
//  FontHelper.swift
//  feeria
//
//  Created by ios1 on 11.08.22.
//

import Foundation
import UIKit

/// Usage: let helveticaNeue = Font(.helveticaNeue(.Medium), size: .custom(20.0)).instance
struct Font {
    
    enum FontType {
        case installed(FontName)
        case custom(String)
        case system
        case systemBold
        case systemItatic
        case systemWeighted(weight: Double)
        case monoSpacedDigit(size: Double, weight: Double)
    }
    
    enum FontSize {
        case standard(StandardSize)
        case custom(Double)
        var value: Double {
            switch self {
            case .standard(let size):
                return size.rawValue
            case .custom(let customSize):
                return customSize
            }
        }
    }
    
    enum FontName: String {
        case MontserratSemibold      = "Montserrat-SemiBold"
        
        case RubikRegular            = "Rubik-Regular"
        case RubikLight              = "Rubik-Light"
        case RubikBold               = "Rubik-Bold"
        case RubikMedium             = "Rubik-Medium"
        
        case RobotoRegular           = "Roboto-Regular"
        case RobotoBold              = "Roboto-Bold"
        case RobotoLight             = "Roboto-Light"
        case RobotoMedium            = "Roboto-Medium"
    }
    
    enum StandardSize: Double {
        case navHeader = 25.8
        case h1 = 20.0
        case h2 = 18.0
        case h3 = 16.0
        case h4 = 14.0
        case h5 = 12.0
        case h6 = 10.0
    }
    
    var type: FontType
    var size: FontSize
    
    init(_ type: FontType, size: FontSize) {
        self.type = type
        self.size = size
    }
}

extension Font {
    
    var instance: UIFont {
        
        var instanceFont: UIFont!
        switch type {
        case .custom(let fontName):
            guard let font =  UIFont(name: fontName, size: CGFloat(size.value)) else {
                fatalError("\(fontName) font is not installed, make sure it added in Info.plist and logged with Utility.logAllAvailableFonts()")
            }
            instanceFont = font
        case .installed(let fontName):
            guard let font =  UIFont(name: fontName.rawValue, size: CGFloat(size.value)) else {
                fatalError("\(fontName.rawValue) font is not installed, make sure it added in Info.plist and logged with Utility.logAllAvailableFonts()")
            }
            instanceFont = font
        case .system:
            instanceFont = UIFont.systemFont(ofSize: CGFloat(size.value))
        case .systemBold:
            instanceFont = UIFont.boldSystemFont(ofSize: CGFloat(size.value))
        case .systemItatic:
            instanceFont = UIFont.italicSystemFont(ofSize: CGFloat(size.value))
        case .systemWeighted(let weight):
            instanceFont = UIFont.systemFont(ofSize: CGFloat(size.value),
                                             weight: UIFont.Weight(rawValue: CGFloat(weight)))
        case .monoSpacedDigit(let size, let weight):
            instanceFont = UIFont.monospacedDigitSystemFont(ofSize: CGFloat(size),
                                                            weight: UIFont.Weight(rawValue: CGFloat(weight)))
        }
        return instanceFont
    }
}
