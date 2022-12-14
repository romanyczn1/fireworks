//
//  LoadingDisplayable.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

import UIKit

protocol LoadingDisplayable: AnyObject {

    var loaderView: LoadingView { get }

    func showLoader(in view: UIView)
    func hideLoader()

}

extension LoadingDisplayable {

    func showLoader(in view: UIView) {
        DispatchQueue.main.async {
            self.loaderView.show(in: view, animated: false, completion: nil)
            self.loaderView.startLoading()
        }
    }

    func hideLoader() {
        DispatchQueue.main.async {
            self.loaderView.hide(animated: true, completion: { _ in
                self.loaderView.stopLoading()
            })
        }
    }

}

extension LoadingDisplayable where Self: UIViewController {

    func showLoader() {
        showLoader(in: self.view)
    }

}
