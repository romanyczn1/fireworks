//
//  ProductDetailViewController.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

import UIKit

class ProductDetailViewController: UIViewController, Storyboarded, Transitionable {
    
    @IBOutlet weak var tableView: UITableView!
    
    var transitionContainerView: UIView! {
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 1)) as? ProductDetailPhotosCell {
            return cell.productImageView
        } else {
            return UIView()
        }
    }
    
    static var storyboardName: String {
        return String(describing: self)
    }
        
    var viewModel: ProductDetailViewModelProtocol?
    var userInterfaceHelper: ProductDetailUIHelperProtocol?
    weak var coordinator: ProductDetailCoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindables()

        viewModel?.getProductDetail(showLoader: true)
    }
    
    // MARK: - Private

    private func setupUI() {
        setupNavigationBar()
        setupTableView()
    }

    private func setupNavigationBar() {
        let backItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.registerNib(cellType: ProductDetailPhotosCell.self)
        tableView.registerNib(cellType: ProductDetailCartCell.self)
        tableView.registerNib(cellType: ProductDetailTitleCell.self)
        tableView.registerNib(cellType: ProductDetailDeliveryCell.self)
        tableView.registerNib(cellType: ProductDetailCharacteristicsCell.self)
        tableView.registerNib(cellType: ProductDetailPaymentMethodsCell.self)
        tableView.registerNib(cellType: ProductDetailPresentsCell.self)
        tableView.registerNib(cellType: ProductDetailReviewCell.self)
        tableView.register(viewType: ProductDetailTypesHeaderView.self)
        tableView.register(cellType: ProductDetailHowToLaunchCell.self)
        tableView.register(viewType: ProductDetailHowToLaunchFooterView.self)
        tableView.register(cellType: ProductDetailDesignCell.self)
        tableView.register(viewType: ProductDetailReviewsFooterView.self)
        tableView.register(cellType: ProductDetailDescriptionCell.self)
        tableView.register(cellType: ProductDetailPhotoCell.self)
        tableView.registerNib(cellType: ProductDetailPostOrderInfoCell.self)
        tableView.registerNib(cellType: ProductDetailManufacturerCell.self)
        tableView.register(cellType: ProductDetailImproveCell.self)
    }

    // MARK: - Reactive Behavior

    private func setupBindables() {
        setupViewBindables()
//        setupLoaderBindable()
//        setupErrorBindables()
//        setupFavoriteBindables()
    }
    
    private func setupViewBindables() {
        viewModel?.didSetupProductDetail.bindAndFire { [weak self] _ in
//            self?.tableView.reloadData()
            self?.userInterfaceHelper?.hideRetryView()
        }
        
        viewModel?.didUpdateSectionAtIndex.bind({ [weak self] section in
            self?.tableView.reloadSections(IndexSet(integer: section), with: .automatic)
        })
    }
}

extension ProductDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        let section = viewModel.section(for: section)
        switch section.selectedType {
        case .productTitle, .productInfo, .cart, .characteristics, .deliveryInfo, .paymentMethods, .presents, .productDesign, .description, .postOrderInfo, .manufacturer, .improveApp:
            return 1
        case .reviews:
            return viewModel.reviews.count
        case .howToLaunch:
            return viewModel.launchRules.count
        case .photos:
            return viewModel.photos.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else { return UITableViewCell() }
        let section = viewModel.section(for: indexPath.section)
        switch section.selectedType {
        case .productTitle:
            let cell = tableView.dequeueReusableCell(with: ProductDetailTitleCell.self, for: indexPath)
            cell.viewModel = viewModel.titleCell
            return cell
        case .productInfo:
            let cell = tableView.dequeueReusableCell(with: ProductDetailPhotosCell.self, for: indexPath)
            cell.viewModel = viewModel.imagesCell
            return cell
        case .cart:
            let cell = tableView.dequeueReusableCell(with: ProductDetailCartCell.self, for: indexPath)
            cell.viewModel = viewModel.cartCell
            return cell
        case .deliveryInfo:
            let cell = tableView.dequeueReusableCell(with: ProductDetailDeliveryCell.self, for: indexPath)
            cell.viewModel = viewModel.deliveryCell
            return cell
        case .characteristics:
            let cell = tableView.dequeueReusableCell(with: ProductDetailCharacteristicsCell.self, for: indexPath)
            cell.viewModel = viewModel.characteristicsCell
            return cell
        case .paymentMethods:
            let cell = tableView.dequeueReusableCell(with: ProductDetailPaymentMethodsCell.self, for: indexPath)
            return cell
        case .presents:
            let cell = tableView.dequeueReusableCell(with: ProductDetailPresentsCell.self, for: indexPath)
            cell.viewModel = viewModel.presentsCell
            return cell
        case .reviews:
            let cell = tableView.dequeueReusableCell(with: ProductDetailReviewCell.self, for: indexPath)
            cell.viewModel = viewModel.reviewCellViewModel(for: indexPath.row)
            return cell
        case .howToLaunch:
            let cell = tableView.dequeueReusableCell(with: ProductDetailHowToLaunchCell.self, for: indexPath)
            cell.viewModel = viewModel.howToLaunchCellViewModel(for: indexPath.row)
            return cell
        case .productDesign:
            let cell = tableView.dequeueReusableCell(with: ProductDetailDesignCell.self, for: indexPath)
            cell.viewModel = viewModel.designCell
            return cell
        case .description:
            let cell = tableView.dequeueReusableCell(with: ProductDetailDescriptionCell.self, for: indexPath)
            cell.viewModel = viewModel.descriptionCell
            return cell
        case .photos:
            let cell = tableView.dequeueReusableCell(with: ProductDetailPhotoCell.self, for: indexPath)
            cell.viewModel = viewModel.photoCellViewModel(for: indexPath.row)
            return cell
        case .postOrderInfo:
            let cell = tableView.dequeueReusableCell(with: ProductDetailPostOrderInfoCell.self, for: indexPath)
            return cell
        case .manufacturer:
            let cell = tableView.dequeueReusableCell(with: ProductDetailManufacturerCell.self, for: indexPath)
            cell.viewModel = viewModel.manufacturerCell
            return cell
        case .improveApp:
            let cell = tableView.dequeueReusableCell(with: ProductDetailImproveCell.self, for: indexPath)
            return cell
        }
    }
}

extension ProductDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let viewModel = viewModel else { return 0 }
        let section = viewModel.section(for: section)
        switch section.selectedType {
        case .productTitle, .productInfo, .cart, .characteristics, .deliveryInfo, .paymentMethods, .presents, .description, .photos, .postOrderInfo, .manufacturer, .improveApp:
            return 0
        case .reviews, .howToLaunch, .productDesign:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard let viewModel = viewModel else { return 0 }
        let section = viewModel.section(for: section)
        switch section.selectedType {
        case .productTitle, .productInfo, .cart, .characteristics, .deliveryInfo, .paymentMethods, .presents, .productDesign, .description, .photos, .postOrderInfo, .manufacturer, .improveApp:
            return 0
        case .howToLaunch, .reviews:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let viewModel = viewModel else { return nil }
        let section = viewModel.section(for: section)
        switch section.selectedType {
        case .productTitle, .productInfo, .cart, .characteristics, .deliveryInfo, .paymentMethods, .presents, .description, .photos, .postOrderInfo, .manufacturer, .improveApp:
            return nil
        case .reviews, .howToLaunch, .productDesign:
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProductDetailTypesHeaderView.dequeueIdentifier) as! ProductDetailTypesHeaderView
            view.configure(selectedType: section.selectedType, with: section.types)
            view.delegate = self
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let viewModel = viewModel else { return nil }
        let section = viewModel.section(for: section)
        switch section.selectedType {
        case .productTitle, .productInfo, .cart, .characteristics, .deliveryInfo, .paymentMethods, .presents, .productDesign, .description, .photos, .postOrderInfo, .manufacturer, .improveApp:
            return nil
        case .reviews:
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProductDetailReviewsFooterView.dequeueIdentifier)
            return view
        case .howToLaunch:
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProductDetailHowToLaunchFooterView.dequeueIdentifier)
            return view
        }
    }
}

extension ProductDetailViewController: ProductDetailTypesHeaderViewDelegate {
    
    func newTypeSelected(_ type: ProductDetailViewSection) {
        viewModel?.newSectionTypeSelected(type: type)
    }
}
