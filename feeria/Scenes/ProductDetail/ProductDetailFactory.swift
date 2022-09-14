//
//  ProductDetailFActory.swift
//  feeria
//
//  Created by ios1 on 19.08.22.
//

final class ProductDetailFactory: ProductDetailFactoryProtocol {
    
    var sections: [ProductDetailCollapsibleSection] =
    [ProductDetailCollapsibleSection(types: [.productTitle], opened: true, selectedType: .productTitle),
     ProductDetailCollapsibleSection(types: [.productInfo], opened: true, selectedType: .productInfo),
     ProductDetailCollapsibleSection(types: [.cart], opened: true, selectedType: .cart),
     ProductDetailCollapsibleSection(types: [.deliveryInfo], opened: true, selectedType: .deliveryInfo),
     ProductDetailCollapsibleSection(types: [.characteristics], opened: true, selectedType: .characteristics),
     ProductDetailCollapsibleSection(types: [.paymentMethods], opened: true, selectedType: .paymentMethods),
     ProductDetailCollapsibleSection(types: [.presents], opened: true, selectedType: .presents),
     ProductDetailCollapsibleSection(types: [.reviews, .howToLaunch, .productDesign], opened: false, selectedType: .reviews),
     ProductDetailCollapsibleSection(types: [.description], opened: true, selectedType: .description),
     ProductDetailCollapsibleSection(types: [.photos], opened: true, selectedType: .photos),
     ProductDetailCollapsibleSection(types: [.postOrderInfo], opened: true, selectedType: .postOrderInfo),
     ProductDetailCollapsibleSection(types: [.manufacturer], opened: true, selectedType: .manufacturer),
     ProductDetailCollapsibleSection(types: [.improveApp], opened: true, selectedType: .improveApp)
    ]
}
