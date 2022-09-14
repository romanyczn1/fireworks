//
//  ShopViewController.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

import UIKit

class ShopViewController: UIViewController, Storyboarded, LoadingDisplayable, TransitionableInitiator {
    
    static var storyboardName: String {
        return String(describing: self)
    }
    
    let tempSizeCell: ProductCell = .loadFromNib()
    let tempSizeFooterView: ShopCollectionViewFooterView = .loadFromNib()
    var tempSizeCellSize: CGSize?

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var searchController: DefaultSearchController!
    
    var viewModel: ShopViewModelProtocol!
    weak var coordinator: ShopCoordinatorProtocol?

    // MARK: - LoadingDisplayable

    var loaderView: LoadingView = RadarView()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupBindables()
        
        viewModel.getCategories()
        viewModel.getProducts()
    }
    
    private func setupUI() {
        setupCollectionView()
        setupSearchController()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerNib(cellType: CategoryCell.self)
        collectionView.registerNib(cellType: ProductCell.self)
        collectionView.register(viewType: SimpleCollectionViewHeaderView.self, kind: UICollectionView.elementKindSectionHeader)
        collectionView.registerNib(viewType: ShopCollectionViewFooterView.self, kind: UICollectionView.elementKindSectionFooter)
    }
    
    private func setupSearchController() {
        guard let coordinator = coordinator else { return }

        searchController = coordinator.embedSearchController(on: self)
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.tintColor = .white
        if #available(iOS 13.0, *) {
            let tf = searchController.searchBar.searchTextField
            tf.backgroundColor = .white.withAlphaComponent(0.12)
            tf.leftView?.tintColor = .white
            tf.textColor = .white
        } else {
            let tf = searchController.searchBar.value(forKey: "searchField") as? UITextField
            tf?.backgroundColor = .white.withAlphaComponent(0.12)
            tf?.leftView?.tintColor = .white
            tf?.textColor = .white
        }
        

        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func setupBindables() {
        viewModel?.sections.bind({ [weak self] sections in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        })
        viewModel?.startLoading.bind({ [weak self] startLoading in
            DispatchQueue.main.async {
                startLoading ? self?.showLoader() : self?.hideLoader()
            }
        })
    }
    
    private func startSearch(_ resultController: SearchProductsResultViewController, withSearchText searchText: String) {
        resultController.startSearch(withSearchText: searchText)
    }
}

extension ShopViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.sections.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch viewModel.sections.value[section] {
        case .categoriesSection:
            return viewModel.categoryCells.count
        case .productsSection:
            return viewModel.productCells.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch viewModel.sections.value[indexPath.section] {
        case .categoriesSection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.dequeueIdentifier, for: indexPath) as! CategoryCell
            cell.viewModel = viewModel.categoryCells[indexPath.row]
            return cell
        case .productsSection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.dequeueIdentifier, for: indexPath) as! ProductCell
            cell.viewModel = viewModel.productCells[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SimpleCollectionViewHeaderView.dequeueIdentifier, for: indexPath) as! SimpleCollectionViewHeaderView
            view.headerTitle = viewModel.sections.value[indexPath.section].title
            return view
        case UICollectionView.elementKindSectionFooter:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ShopCollectionViewFooterView.dequeueIdentifier, for: indexPath)
            return view
        default:
            return UICollectionReusableView()
        }
    }
}

extension ShopViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch viewModel.sections.value[indexPath.section] {
        case .categoriesSection:
            break
        case .productsSection:
//            guard let cell = collectionView.cellForItem(at: indexPath) as? ProductCell else {
//                return
//            }
//
//            let imageToTransition = cell.productImageView.image
//            let productImageViewFrameInCV = cell.convert(cell.productImageView.frame, to: collectionView)
//            let productImageViewFrameInView = collectionView.convert(productImageViewFrameInCV, to: collectionView.superview)
//
//            let navigationConfiguration = ShopNavigationConfiguration(selectedFrame: productImageViewFrameInView,
//                                                                                imageToTransition: imageToTransition,
//                                                                                transitionOffset: 0)

            coordinator?.showProductDetail(at: indexPath.item, for: viewModel.products, with: nil)//navigationConfiguration)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch viewModel.sections.value[indexPath.section] {
        case .categoriesSection:
            let width = collectionView.bounds.width / 4
            return CGSize(width: width, height: width)
        case .productsSection:
            if let tempSizeCellSize = tempSizeCellSize {
                return tempSizeCellSize
            } else {
                let width = (collectionView.bounds.width - (15 + 13.5 + 19.5 + 0.1)) / 2
                
                tempSizeCell.frame = CGRect(origin: .zero,
                                            size: CGSize(width: width, height: 1000))
                tempSizeCell.viewModel = viewModel.productCells[indexPath.row]
                tempSizeCell.setNeedsLayout()
                tempSizeCell.layoutIfNeeded()
                
                let size = tempSizeCell.systemLayoutSizeFitting(
                    CGSize(width: width, height: .greatestFiniteMagnitude),
                    withHorizontalFittingPriority: .required,
                    verticalFittingPriority: .defaultLow)
                
                tempSizeCellSize = size
                return size
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        // only last section
        if section == viewModel.sections.value.count - 1 {
            tempSizeFooterView.layoutIfNeeded()
            let height = tempSizeFooterView.systemLayoutSizeFitting(UIView.layoutFittingExpandedSize).height
            return CGSize(width: collectionView.frame.width, height: height)
        }
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch viewModel.sections.value[section] {
        case .categoriesSection:
            return .zero
        case .productsSection:
            return UIEdgeInsets(top: 0, left: 15, bottom: 15, right: 13.5)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch viewModel.sections.value[section] {
        case .categoriesSection:
            return 0
        case .productsSection:
            return 40
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch viewModel.sections.value[section] {
        case .categoriesSection:
            return 0
        case .productsSection:
            return 19.5
        }
    }
}

extension ShopViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchResultsController = searchController.searchResultsController as? SearchProductsResultViewController else {
            return
        }
        searchController.searchResultsController?.view.isHidden = false
        if let isEmpty = searchController.searchBar.text?.isEmpty,
            isEmpty {
            searchResultsController.resetSearch()
        }
    }
}

extension ShopViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text,
            !searchText.isEmpty,
            let searchResultsController = searchController.searchResultsController as? SearchProductsResultViewController else {
                return
        }
        startSearch(searchResultsController, withSearchText: searchText)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        guard let searchResultsController = searchController.searchResultsController as? SearchProductsResultViewController else {
            return
        }
        searchResultsController.resetSearch()
    }
}

extension ShopViewController: SearchProductsResultViewControllerDelegate {
    
    func searchMoviesResultController(_ searchProductsResultController: SearchProductsResultViewController, didSelectRecentSearch searchText: String) {
        searchController.searchBar.text = searchText
        guard let searchText = searchController.searchBar.text,
            !searchText.isEmpty,
            let searchResultsController = searchController.searchResultsController as? SearchProductsResultViewController else {
                return
        }
        searchController.searchBar.endEditing(true)
        startSearch(searchResultsController, withSearchText: searchText)
    }
}
