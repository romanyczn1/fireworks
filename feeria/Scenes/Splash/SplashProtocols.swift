//
//  SplashProtocols.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

import Foundation

protocol SplashViewModelProtocol {

    var initialDownloadsEnded: (() -> Void)? { get set }

    func startInitialDownloads()

}

protocol SplashInteractorProtocol {

    func loadCart(completion: @escaping (Result<CartDomain, Error>) -> Void)
}
