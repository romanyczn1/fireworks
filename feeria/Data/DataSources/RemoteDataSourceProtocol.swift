//
//  RemoteDataSourceProtocol.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

protocol RemoteDataSourceProtocol {

    func categoryDataSource() -> CategoryRemoteDataSourceProtocol
    func cartDataSource() -> CartRemoteDataSourceProtocol
    func productDataSource() -> ProductRemoteDataSourceProtocol
}
