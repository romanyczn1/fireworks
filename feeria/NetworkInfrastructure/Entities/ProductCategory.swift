//
//  ProductCategory.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

struct ProductCategory: Decodable {

    let id: Int
    let title: String

    private enum CodingKeys: String, CodingKey {
        case id
        case title
    }

    // MARK: - Initializers

    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }

}

extension ProductCategory {

    func asDomain() -> ProductCategoryDomain {
        return ProductCategoryDomain(id: id, title: title)
    }

}
