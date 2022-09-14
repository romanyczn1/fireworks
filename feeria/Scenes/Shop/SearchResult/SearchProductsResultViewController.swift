//
//  SearchProductsResultViewController.swift
//  feeria
//
//  Created by ios1 on 17.08.22.
//

import UIKit

protocol SearchProductsResultViewControllerDelegate: UIViewController {

    func searchMoviesResultController(_ searchProductsResultController: SearchProductsResultViewController, didSelectRecentSearch searchText: String)

}

class SearchProductsResultViewController: UIViewController {

    private var viewModel: SearchProductsResultViewModelProtocol

    weak var delegate: SearchProductsResultViewControllerDelegate?
    weak var coordinator: ShopCoordinatorProtocol?

    var searchMoviesResultView = SearchProductsResultView()

    // MARK: - Initializers

    init(viewModel: SearchProductsResultViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    // MARK: - Lifecycle

    override func loadView() {
        super.loadView()
        view = searchMoviesResultView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindables()
    }

    // MARK: - Private

    private func setupUI() {
        view.backgroundColor = ColorPalette.defaultBackgroundColor
        setupTableView()
    }

    private func setupTableView() {
        let tableView = searchMoviesResultView.tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .onDrag
        if #available(iOS 15.0, *) { tableView.sectionHeaderTopPadding = .zero }
        tableView.register(SimpleTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: SimpleTableViewHeaderView.dequeueIdentifier)
        tableView.registerNib(cellType: ProductListCell.self)
        tableView.registerNib(cellType: RecentSearchCell.self)
    }

    private func reloadTableView() {
        searchMoviesResultView.tableView.reloadData()
    }
    
    private func configureView(with state: SearchProductsResultViewState) {
        let tableView = searchMoviesResultView.tableView
        tableView.separatorStyle = .none
        switch state {
        case .empty:
            tableView.tableFooterView = CustomFooterView(message: NSLocalizedString("emptySearchResult", comment: ""))
        case .populated, .initial:
            tableView.tableFooterView = UIView()
            tableView.separatorStyle = .singleLine
        case .searching:
            tableView.tableFooterView = searchMoviesResultView.loadingFooterView
        case .error(let error):
            tableView.tableFooterView = CustomFooterView(message: error.localizedDescription)
        }
    }

    // MARK: - Reactive Behavior

    private func setupBindables() {
        viewModel.viewState.bindAndFire({ [weak self] state in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.configureView(with: state)
                self.reloadTableView()
            }
        })
    }

    // MARK: - Internal

    func startSearch(withSearchText searchText: String) {
        viewModel.clearProducts()
        viewModel.searchProducts(withSearchText: searchText)
    }

    func resetSearch() {
        viewModel.clearProducts()
    }

}

// MARK: - UITableViewDataSource

extension SearchProductsResultViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.viewState.value.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = viewModel.viewState.value.sections?[section] else { return 0 }
        switch section {
        case .recentSearches:
            return viewModel.recentSearchCells.count
        case .products:
            return viewModel.productCells.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = viewModel.viewState.value.sections?[indexPath.section] else { return UITableViewCell() }
        switch section {
        case .recentSearches:
            let cell = tableView.dequeueReusableCell(with: RecentSearchCell.self, for: indexPath)
            cell.viewModel = viewModel.recentSearchCells[indexPath.row]
            return cell
        case .products:
            let cell = tableView.dequeueReusableCell(with: ProductListCell.self, for: indexPath)
            cell.viewModel = viewModel.productCells[indexPath.row]
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension SearchProductsResultViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewState = viewModel.viewState.value
        switch viewState {
        case .initial:
            guard viewModel.recentSearchCells.count > 0 else { return }
            let searchText = viewModel.recentSearchCells[indexPath.row].searchText
            delegate?.searchMoviesResultController(self, didSelectRecentSearch: searchText)
        case .populated:
            coordinator?.showProductDetail(at: indexPath.row, for: viewModel.products, with: nil)
        case .empty, .error, .searching:
            return
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let section = viewModel.viewState.value.sections?[section] else { return nil }
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: SimpleTableViewHeaderView.dequeueIdentifier) as! SimpleTableViewHeaderView
        view.headerTitle = section.title
        return view
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let section = viewModel.viewState.value.sections?[section] else { return 0 }
        if section.title != nil {
            return UITableView.automaticDimension
        } else {
            return 0
        }
    }

}
