//
//  ProductResult.swift
//  feeria
//
//  Created by ios1 on 17.08.22.
//

struct ProductResult: Decodable {

    let results: [Product]

    private enum CodingKeys: String, CodingKey {
        case results
    }

}
