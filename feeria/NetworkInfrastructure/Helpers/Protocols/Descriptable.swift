//
//  Descriptable.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

protocol Descriptable {

    var description: String { get }

}

protocol ErrorDescriptable: Descriptable {}
