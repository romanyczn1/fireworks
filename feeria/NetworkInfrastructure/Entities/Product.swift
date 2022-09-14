//
//  Product.swift
//  feeria
//
//  Created by ios1 on 17.08.22.
//

struct Product: Decodable {
    
    let id: Int
    let name: String
    let rating: Double
    let commentsCount: Int
    let localImage: String
    let chargesCount: Int
    let inchesCount: Double
    let timeCount: Int
    let price: Double
    let discount: Double

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case rating
        case commentsCount
        case localImage
        case chargesCount
        case inchesCount
        case timeCount
        case price
        case discount
    }

    // MARK: - Initializers

    init(id: Int,
         name: String,
         rating: Double,
         commentsCount: Int,
         localImage: String,
         chargesCount: Int,
         inchesCount: Double,
         timeCount: Int,
         price: Double,
         discount: Double) {
        self.id = id
        self.name = name
        self.rating = rating
        self.commentsCount = commentsCount
        self.localImage = localImage
        self.chargesCount = chargesCount
        self.inchesCount = inchesCount
        self.timeCount = timeCount
        self.price = price
        self.discount = discount
    }

}

extension Product {

    func asDomain() -> ProductDomain {
        return ProductDomain(id: id, name: name, rating: rating, commentsCount: commentsCount, chargesCount: chargesCount, inchesCount: inchesCount, timeCount: timeCount, price: price, discount: discount)
    }

}
