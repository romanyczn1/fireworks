//
//  RemoteDataSource.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

final class RemoteDataSource: RemoteDataSourceProtocol {
    
    public init() {}
    
    func categoryDataSource() -> CategoryRemoteDataSourceProtocol {
        let client = CategoryClient()
        return CategoryRemoteDataSource(client: client)
    }
    
    func cartDataSource() -> CartRemoteDataSourceProtocol {
        let client = CartClient()
        return CartRemoteDataSource(client: client)
    }
    
    func productDataSource() -> ProductRemoteDataSourceProtocol {
        let client = ProductClient()
        return ProductRemoteDataSource(client: client)
    }
}
