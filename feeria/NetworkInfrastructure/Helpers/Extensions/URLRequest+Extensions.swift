//
//  URLRequest+Extensions.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

import Foundation

extension URLRequest {

    mutating func setJSONContentType() {
        setValue("application/json; charset=utf-8",
                 forHTTPHeaderField: "Content-Type")
    }

    mutating func setHeader(for httpHeaderField: String, with value: String) {
        setValue(value, forHTTPHeaderField: httpHeaderField)
    }

}
