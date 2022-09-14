//
//  CartResult.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

struct CartResult: Decodable {

    let result: Cart

    private enum CodingKeys: String, CodingKey {
        case result
    }

}
