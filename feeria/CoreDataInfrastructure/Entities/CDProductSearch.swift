//
//  CDProductSearch.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

import CoreData

final class CDProductSearch: NSManagedObject {

    @NSManaged private(set) var id: String
    @NSManaged private(set) var searchText: String
    @NSManaged private(set) var createdAt: Date

    static func insert(into context: NSManagedObjectContext, searchText: String) -> CDProductSearch {
        let productSearch: CDProductSearch = context.insertObject()
        productSearch.id = UUID().uuidString
        productSearch.searchText = searchText
        productSearch.createdAt = Date()
        return productSearch
    }

}

extension CDProductSearch: DomainConvertible {

    func asDomain() -> ProductSearchDomain {
        return ProductSearchDomain(id: id, searchText: searchText, createdAt: createdAt)
    }

}

extension CDProductSearch: Managed {

    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(createdAt), ascending: false)]
    }

}
