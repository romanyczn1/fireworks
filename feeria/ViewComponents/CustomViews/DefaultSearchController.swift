//
//  DefaultSearchController.swift
//  feeria
//
//  Created by ios1 on 15.08.22.
//

import UIKit

class DefaultSearchController: UISearchController {

    override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: searchResultsController)
        searchBar.searchBarStyle = UISearchBar.Style.minimal
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

}
