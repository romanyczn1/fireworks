//
//  DomainConvertible.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

protocol DomainConvertible {

    associatedtype Domain

    func asDomain() -> Domain

}
