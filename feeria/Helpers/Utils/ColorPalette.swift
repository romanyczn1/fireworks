//
//  ColorPalette.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

import UIKit

extension UIColor {
    
    convenience init(withIntRed red: Int, green: Int, blue: Int, alpha: CGFloat) {
           assert(red >= 0 && red <= 255, "Invalid red component")
           assert(green >= 0 && green <= 255, "Invalid green component")
           assert(blue >= 0 && blue <= 255, "Invalid blue component")

           self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
       }

    convenience init(rgb: Int, alpha: CGFloat) {
           self.init(
               withIntRed: (rgb >> 16) & 0xFF,
               green: (rgb >> 8) & 0xFF,
               blue: rgb & 0xFF,
               alpha: alpha
           )
       }
}

struct ColorPalette {

    static let mainAppColor = UIColor(rgb: 0x6C0068, alpha: 1)
    
    static let gray1 = UIColor(rgb: 0x333333, alpha: 1)
    static let gray2 = UIColor(rgb: 0x999999, alpha: 1)
    static let gray3 = UIColor(rgb: 0x828282, alpha: 1)
    static let gray4 = UIColor(rgb: 0xBDBDBD, alpha: 1)
    static let gray5 = UIColor(rgb: 0x666666, alpha: 1)
    static let gray6 = UIColor(rgb: 0x4F4F4F, alpha: 1)
    
    static let orange = UIColor(rgb: 0xFF7608, alpha: 1)
    static let green = UIColor(rgb: 0x019A4A, alpha: 1)
    static let yellow = UIColor(rgb: 0xF2C94C, alpha: 1)
    
    static let greenBackground = UIColor(rgb: 0x00D26D, alpha: 1)
    static let lightGreenBackground = UIColor(rgb: 0xE2F6EB, alpha: 1)
    static let lightGrayBackground = UIColor(rgb: 0xF2F2F2, alpha: 1)
    
    
    static let starYellow = UIColor(rgb: 0xFEB414, alpha: 1)
    
    static let veryLightPurple = UIColor(rgb: 0xF3E4F3, alpha: 1)
    
    static let lightBlueColor = UIColor(withIntRed: 74, green: 144, blue: 226, alpha: 1)
//    static let darkBlueColor = UIColor(withIntRed: 0, green: 101, blue: 163, alpha: 1)
    static let lightGrayColor = UIColor(withIntRed: 205, green: 205, blue: 205, alpha: 1)
//    static let redColor = UIColor(withIntRed: 255, green: 94, blue: 112, alpha: 1)
//    static let grayColor = UIColor(withIntRed: 130, green: 130, blue: 130, alpha: 1)
    static let whiteColor = UIColor(white: 249 / 255, alpha: 1)
    static let blackColor = UIColor(white: 40 / 255, alpha: 1)
    static let darkGrayColor = UIColor.darkGray
//    static let regularGray = UIColor.systemGray

    static var defaultBackgroundColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.systemBackground
        } else {
            return whiteColor
        }
    }

    static var defaultGrayBackgroundColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.systemGray6
        } else {
            return .lightGray
        }
    }

    static var navigationBarBackgroundColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.systemBackground
        } else {
            return whiteColor
        }
    }

    static var groupedCellBackgroundColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.secondarySystemGroupedBackground
        } else {
            return whiteColor
        }
    }

    struct Label {
        static var defaultColor: UIColor {
            if #available(iOS 13.0, *) {
                return UIColor.label
            } else {
                return ColorPalette.blackColor
            }
        }
    }

}
