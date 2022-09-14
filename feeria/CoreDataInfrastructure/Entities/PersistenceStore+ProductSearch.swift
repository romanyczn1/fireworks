//
//  PersistenceStore+ProductSearch.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

extension PersistenceStore where Entity == CDProductSearch {

    func saveProductSearch(with searchText: String, completion: ((Bool) -> Void)? = nil) {
        managedObjectContext.performChanges {
            _ = CDProductSearch.insert(into: self.managedObjectContext,
                                     searchText: searchText)
            completion?(true)
        }
    }

    func findAll() -> [CDProductSearch] {
        return CDProductSearch.fetch(in: managedObjectContext)
    }

}

