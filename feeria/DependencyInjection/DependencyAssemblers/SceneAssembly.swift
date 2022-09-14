//
//  SceneAssembly.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

import Foundation
import Swinject

final class SceneAssembly: Assembly {

    func assemble(container: Container) {
        let assemblies: [Assembly] = [
            SplashAssembly(),
            ShopAssembly(),
            SearchProductsAssembly(),
            ProductDetailPagerAssembly(),
            ProductDetailAssembly()
        ]
        assemblies.forEach { $0.assemble(container: container) }
    }

}
