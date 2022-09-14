//
//  ProductDetailPagerViewController.swift
//  feeria
//
//  Created by ios1 on 23.08.22.
//

import UIKit

class ProductDetailPagerViewController: ProductButtonBarPagerTabStripViewController, Storyboarded {
    
    static var storyboardName: String {
        return String(describing: self)
    }
    
    var viewModel: ProductDetailPagerViewModelProtocol?
    weak var coordinator: ProductDetailPagerCoordinatorProtocol?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        pagerBehaviour = .common(skipIntermediateViewControllers: true)
        
        changeCurrentIndex = { (oldCell: ProductBarCell?, newCell: ProductBarCell?, animated: Bool) -> Void in
            oldCell?.layer.borderWidth = 0

            newCell?.layer.borderWidth = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindables()
    }
    
    // MARK: - Private

    private func setupUI() {
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        let backItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
    }

    // MARK: - Reactive Behavior

    private func setupBindables() {
        setupViewBindables()
//        setupLoaderBindable()
//        setupErrorBindables()
//        setupFavoriteBindables()
    }
    
    private func setupViewBindables() {
        viewModel?.needUpdateControllers.bindAndFire { [weak self] _ in
            self?.reloadViewControllers()
        }
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        guard let viewModel = viewModel, let coordinator = coordinator else { return [] }
        
        return viewModel.products.map({
            coordinator.productDetailController(with: $0)
        })
    }
    
    override func configureCell(_ cell: ProductBarCell, indicatorInfo: IndicatorInfo, indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        
        cell.viewModel = viewModel.barCellViewModel(for: indexPath)
    }
}
