//
//  DataSourceAssembly.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

import Foundation
import Swinject

final class DataSourceAssembly: Assembly {

    func assemble(container: Container) {
        container.register(LocalDataSourceProtocol.self) { _ in
            return LocalDataSource()
        }
        container.register(RemoteDataSourceProtocol.self) { _ in
            return RemoteDataSource()
        }
    }

}
