//
//  ProgressHUDAdapter.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

import DLProgressHUD

final class ProgressHUDAdapter: ProgressHUDAdapterProtocol {

    func showHUDWithOnlyText(_ text: String) {
        DLProgressHUD.defaultConfiguration.allowsDynamicTextWidth = true
        DLProgressHUD.defaultConfiguration.shouldDismissAutomatically = true
        DLProgressHUD.defaultConfiguration.hudContentPreferredHeight = 64.0
        DLProgressHUD.show(.textOnly(text))
    }

}
