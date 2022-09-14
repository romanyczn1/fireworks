//
//  RetryActionable.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

protocol RetryActionable {

    var retry: (() -> Void)? { get set }

    func resetState()

}
