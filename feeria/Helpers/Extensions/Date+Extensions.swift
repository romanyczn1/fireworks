//
//  Date+Extensions.swift
//  feeria
//
//  Created by ios1 on 6.09.22.
//

import Foundation

extension Date {

    func toString(format: String = "dd.MM.yy") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
