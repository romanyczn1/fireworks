//
//  NetworkConfiguration.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

final class NetworkConfiguration {

    static let shared = NetworkConfiguration()

    var baseAPIURLString: String {
        return "https://www.feeeriya.ru"
    }

    private init() {}

}
