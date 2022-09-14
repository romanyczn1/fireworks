//
//  ProductDomain.swift
//  feeria
//
//  Created by ios1 on 11.08.22.
//

struct ProductDomain {

    public let id: Int
    public let name: String
    public let rating: Double
    public let commentsCount: Int
    public let localImage: String
    public let chargesCount: Int
    public let inchesCount: Double
    public let timeCount: Int
    public let price: Double
    public let discount: Double
    
    // MARK: - Initializers

    public init(id: Int,
                name: String,
                rating: Double,
                commentsCount: Int,
                localImage: String = "salute_image",
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
