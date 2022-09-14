//
//  ProductCategoryDomain.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

struct ProductCategoryDomain: Equatable {

    public let id: Int
    public let title: String
    public let localImage: String

    // MARK: - Initializers

    public init(id: Int, title: String, localImage: String = "salute") {
        self.id = id
        self.title = title
        self.localImage = localImage
    }

}
