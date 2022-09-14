//
//  ProductDetailProtocols.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

import UIKit

protocol ProductDetailViewModelProtocol {
    
    var reviews: [TempReview] { get }
    var launchRules: [String] { get }
    var photos: [String] { get }
    
    var startLoading: Bindable<Bool> { get }
    var isFavorite: Bindable<Bool> { get }
    var showErrorView: Bindable<Error?> { get }
    var didSetupProductDetail: Bindable<Bool> { get }
    var didUpdateFavoriteSuccess: Bindable<Bool> { get }
    var didUpdateFavoriteFailure: Bindable<Error?> { get }
    var didUpdateSectionAtIndex: Bindable<Int> { get }
    
    var titleCell: ProductDetailTitleCellViewModelProtocol { get }
    var imagesCell: ProductDetailPhotosCellViewModelProtocol { get }
    var cartCell: ProductDetailCartCellViewModelProtocol { get }
    var deliveryCell: ProductDetailDeliveryCellViewModelProtocol { get }
    var characteristicsCell: ProductDetailCharacteristicsCellViewModelProtocol { get }
    var presentsCell: ProductDetailPresentsCellViewModelProtocol { get }
    var designCell: ProductDetailDesignCellViewModelProtocol { get }
    var descriptionCell: ProductDetailDescriptionCellViewModelProtocol { get }
    var manufacturerCell: ProductDetailManufacturerCellViewModelProtocol { get }
    
    func reviewCellViewModel(for index: Int) -> ProductDetailReviewCellViewModelProtocol
    func howToLaunchCellViewModel(for index: Int) -> ProductDetailHowToLaunchCellViewModelProtocol
    func photoCellViewModel(for index: Int) -> ProductDetailPhotoCellViewModelProtocol
    
    var shouldHideFavoriteButton: (() -> Void)? { get set }

    func section(for index: Int) -> ProductDetailCollapsibleSection
    func numberOfSections() -> Int
    
    func getProductDetail(showLoader: Bool)
    func saveVisitedProduct()
    func checkIfProductIsFavorite(showLoader: Bool)
    func handleFavoriteProduct()

    func newSectionTypeSelected(type: ProductDetailViewSection)
}

protocol ProductDetailInteractorProtocol {

    func isUserSignedIn() -> Bool

    func getProductDetail(for productId: Int, completion: @escaping (Result<ProductDomain, Error>) -> Void)

    func markProductAsFavorite(movieId: Int, favorite: Bool, completion: @escaping (Result<Bool, Error>) -> Void)
    
}

protocol ProductDetailFactoryProtocol {

    var sections: [ProductDetailCollapsibleSection] { get set }
}

protocol ProductDetailCoordinatorProtocol: AnyObject {

}

protocol ProductDetailUIHelperProtocol {

    func showHUD(with text: String)

    func showFullscreenLoader(in view: UIView)
    func dismissFullscreenLoader()

    func presentRetryView(in view: UIView,
                          with errorMessage: String?,
                          retryHandler: @escaping () -> Void)
    func hideRetryView()

}
