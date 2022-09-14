//
//  ProductSearchDomain.swift
//  feeria
//
//  Created by ios1 on 17.08.22.
//

import Foundation

public struct ProductSearchDomain {

    public let id: String
    public let searchText: String
    public let createdAt: Date

    public init(id: String, searchText: String, createdAt: Date) {
        self.id = id
        self.searchText = searchText
        self.createdAt = createdAt
    }

}
