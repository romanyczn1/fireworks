//
//  Cart.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

struct Cart: Decodable {

    let id: Int

    private enum CodingKeys: String, CodingKey {
        case id
    }

    // MARK: - Initializers

    init(id: Int) {
        self.id = id
    }

}

extension Cart {

    func asDomain() -> CartDomain {
        return CartDomain(id: id)
    }

}
