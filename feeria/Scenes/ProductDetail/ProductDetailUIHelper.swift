//
//  ProductDetailUIHelper.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

import UIKit

final class ProductDetailUIHelper: ProductDetailUIHelperProtocol, LoadingDisplayable, Retryable {

    private let progressHUDAdapter: ProgressHUDAdapterProtocol

    // MARK: - LoadingDisplayable

    var loaderView: LoadingView = RadarView()

    // MARK: - Initializers

    init(progressHUDAdapter: ProgressHUDAdapterProtocol) {
        self.progressHUDAdapter = progressHUDAdapter
    }

    // MARK: - MovieDetailUIHelperProtocol

    func showHUD(with text: String) {
        progressHUDAdapter.showHUDWithOnlyText(text)
    }

    func showFullscreenLoader(in view: UIView) {
        showLoader(in: view)
    }

    func dismissFullscreenLoader() {
        hideLoader()
    }

}
