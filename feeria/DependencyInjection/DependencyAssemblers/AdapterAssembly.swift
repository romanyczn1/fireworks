//
//  AdapterAssembly.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

import Foundation
import Swinject

final class AdapterAssembly: Assembly {

    func assemble(container: Container) {
        container.register(ProgressHUDAdapterProtocol.self) { _ in
            ProgressHUDAdapter()
        }.inObjectScope(.container)
    }

}
