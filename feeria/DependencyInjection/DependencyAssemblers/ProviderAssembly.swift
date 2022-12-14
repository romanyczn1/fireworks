//
//  ProviderAssembly.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

import Foundation
import Swinject

final class ProviderAssembly: Assembly {

    func assemble(container: Container) {
        container.register(UseCaseProviderProtocol.self) { resolver in
            guard let localDataSource = resolver.resolve(LocalDataSourceProtocol.self) else {
                fatalError("LocalDataSourceProtocol dependency could not be resolved")
            }
            guard let remoteDataSource = resolver.resolve(RemoteDataSourceProtocol.self) else {
                fatalError("RemoteDataSourceProtocol dependency could not be resolved")
            }
            return UseCaseProvider(localDataSource: localDataSource, remoteDataSource: remoteDataSource)
        }
    }

}
