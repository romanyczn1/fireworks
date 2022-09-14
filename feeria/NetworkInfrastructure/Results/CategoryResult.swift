//
//  CategoryResult.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

struct CategoryResult: Decodable {

    let results: [ProductCategory]

    private enum CodingKeys: String, CodingKey {
        case results
    }

}
