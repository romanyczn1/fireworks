//
//  Result+Optional.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

import Foundation

extension Result {

    func getWrappedValue() -> Success? {
        return try? get()
    }

}
