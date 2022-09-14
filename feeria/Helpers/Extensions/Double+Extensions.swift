//
//  Double+Extensions.swift
//  feeria
//
//  Created by ios1 on 15.08.22.
//

import Foundation

extension Double {
    
    func withSpaces(decimalSeparator: String = ".") -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 1
        formatter.decimalSeparator = "."
        formatter.groupingSeparator = " "
        
        let sumWithoutCoins = Int(self)
        let sumWithoutCoinsString = (formatter.string(from: NSNumber(value: sumWithoutCoins)) ?? "0").split(separator: ".").first ?? "0"
        let coinsString = formatter.string(from: self as NSNumber)?.split(separator: ".").last ?? "00"
        
        let result: String
        
        if coinsString == "0" {
            result = String(sumWithoutCoinsString)
        } else {
            result = "\(sumWithoutCoinsString)\(decimalSeparator)" + coinsString
        }
        
        return result
    }
    
    func withSpacesWithoutCoins() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        formatter.groupingSeparator = " "
        
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }

}
