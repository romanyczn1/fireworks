//
//  ProductDetailViewModel.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

import Foundation

final class ProductDetailViewModel: ProductDetailViewModelProtocol {
    
    // MARK: - Dependencies
    
    private let interactor: ProductDetailInteractorProtocol
    private var factory: ProductDetailFactoryProtocol
    
    // MARK: - Reactive properties
    
    private(set) var startLoading: Bindable<Bool> = Bindable(false)
    private(set) var isFavorite: Bindable<Bool> = Bindable(false)
    
    private(set) var showErrorView: Bindable<Error?> = Bindable(nil)
    
    private(set) var didSetupProductDetail: Bindable<Bool> = Bindable(true)
    
    private(set) var didUpdateFavoriteSuccess: Bindable<Bool> = Bindable(false)
    private(set) var didUpdateFavoriteFailure: Bindable<Error?> = Bindable(nil)
    private(set) var didUpdateSectionAtIndex: Bindable<Int> = Bindable(0)
    
    var shouldHideFavoriteButton: (() -> Void)?
    
    // MARK: - Properties
    
    var titleCell: ProductDetailTitleCellViewModelProtocol {
        return ProductDetailTitleCellViewModel(title: product.name, vendorCode: "88888888", rating: product.rating)
    }
    
    var imagesCell: ProductDetailPhotosCellViewModelProtocol {
        return ProductDetailPhotosCellViewModel(Array(repeating: product.localImage, count: 8))
    }
    
    var cartCell: ProductDetailCartCellViewModelProtocol {
        return ProductDetailCartCellViewModel(price: product.price, discount: product.discount)
    }
    
    var deliveryCell: ProductDetailDeliveryCellViewModelProtocol {
        return ProductDetailDeliveryCellViewModel()
    }
    
    var characteristicsCell: ProductDetailCharacteristicsCellViewModelProtocol {
        return ProductDetailCharacteristicsCellViewModel(chargeCount: product.chargesCount, inchesCount: product.inchesCount, timeCount: product.timeCount, height: 35, effectsCount: 11, type: "Быстро-")
    }
    
    var presentsCell: ProductDetailPresentsCellViewModelProtocol {
        return ProductDetailPresentsCellViewModel(presents: [TempPresent(name: "Дисконтная карта 15%", image: "present_image"),
                                                             TempPresent(name: "Настольный календарь", image: "present_image"),
                                                             TempPresent(name: "Ветростойкие спички", image: "present_image"),
                                                             TempPresent(name: "Блокнот", image: "present_image"),
                                                             TempPresent(name: "Шоколадка", image: "present_image"),
                                                             TempPresent(name: "Бонусов", image: "present_image")])
    }
    
    var designCell: ProductDetailDesignCellViewModelProtocol {
        return ProductDetailDesignCellViewModel(image: "design_image", text: "Батарея салютов состоит из собранных вместе заряженных трубок. Все трубки соединены огнепроводным шнуром с разной скоростью горения.\n\nКаждая трубка, содержит в себе вышибной заряд, поднимающий заряд фейерверка (бумажный шарик с салютом внутри) на нужную высоту.\n\nФейерверочный заряд содержит в себе замедлитель, за счет которого фейерверочный заряд не разрывается сразу а успевает подняться на нужную высоту.")
    }
    
    var descriptionCell: ProductDetailDescriptionCellViewModelProtocol {
        return ProductDetailDescriptionCellViewModel(description: "Золотые вертушки с цветными пионами, золотые шуршащие мохнатые мотыльки с красным пионом, красные хризантемы в трещащих золотых облаках, трещащие пальмы, обширные трещащие серебряные сферы, зеленые хризантемы с трещащей сферой, трещащие ивы с зеленым пионом. В финале обширная золотая трещащая сфера.",
                                                     attention: "Все фейерверки обрабатываются специальными антисептическими средствами прежде, чем отправиться к клиентам.")
    }
    
    var manufacturerCell: ProductDetailManufacturerCellViewModelProtocol {
        return ProductDetailManufacturerCellViewModel(
            image: "manufacturer_image",
            name: "Фейерверки \"Пиродизайнер\"",
            foundedYear: 2014,
            specialization: "бытовые фейерверки",
            numberOfProducts: 80,
            numberOfProductsInStock: 19,
            rating: 4.8,
            description: "Год за годом «Пиродизайнер» доказывает, что эффектные красочные салюты доступны всем независимо от бюджета. В линейке бренда представлены фейерверки разных типов: малые, средние, большие, а также супер-фейерверки.\n\nЭксперты «Пиродизайнера» знают, как важна каждая деталь, поэтому уделяют повышенное внимание всем нюансам. Продукция «Пиродизайнер» отличается продуманными эффектами, высоким качеством исполнения, современным дизайном упаковки, высокой отказоустойчивостью. И всё это — по демократичным ценам.")
    }
    
    private var id: Int!
    private var product: ProductDomain!
    private var needsFetch: Bool = false
    
    private(set) var reviews: [TempReview] =
    [TempReview(date: Date(), name: "Александр", text: "Очень красиво. Запускали на даче в юбилей мамы, понравилось и нам и всем соседям, до сих пор получаем восторженные остзывы :)", raiting: 5),
     TempReview(date: Date(), name: "Александр", text: "Очень красиво. Запускали на даче в юбилей мамы, понравилось и нам и всем соседям, до сих пор получаем восторженные остзывы :)", raiting: 3),
     TempReview(date: Date(), name: "Александр", text: "Очень красиво. Запускали на даче в юбилей мамы, понравилось и нам и всем соседям, до сих пор получаем восторженные остзывы :)", raiting: 2),
     TempReview(date: Date(), name: "Александр", text: "Очень красиво. Запускали на даче в юбилей мамы, понравилось и нам и всем соседям, до сих пор получаем восторженные остзывы :)", raiting: 3.5)]
    
    private(set) var launchRules: [String] = ["Установить фейерверк на ровную твердую горизонтальную поверхность,",
                                              "освободить и расправить фитиль,",
                                              "поджечь фитиль с вытянутой руки",
                                              "и немедленно отойти на безопасное расстояние 30м."]
    
    private(set) var photos: [String] = ["product_image",
                                         "product_image",
                                         "product_image",
                                         "product_image"]
    
    // MARK: - Initializers
    
    init(_ product: ProductDomain, interactor: ProductDetailInteractorProtocol, factory: ProductDetailFactoryProtocol) {
        self.interactor = interactor
        self.factory = factory
        
        setupProduct(product)
    }
    
    init(id: Int, interactor: ProductDetailInteractorProtocol, factory: ProductDetailFactoryProtocol) {
        self.id = id
        self.interactor = interactor
        self.factory = factory
        
        needsFetch = true
    }
    
    // MARK: - Private
    
    private func setupProduct(_ product: ProductDomain) {
        self.product = product
        
        didSetupProductDetail.value = true
    }
    
    // MARK: - ProductDetailViewModelProtocol
    
    func section(for index: Int) -> ProductDetailCollapsibleSection {
        return factory.sections[index]
    }
    
    func numberOfSections() -> Int {
        return factory.sections.count
    }
    
    func reviewCellViewModel(for index: Int) -> ProductDetailReviewCellViewModelProtocol {
        let review = reviews[index]
        return ProductDetailReviewCellViewModel(date: review.date, name: review.name, text: review.text, rating: review.raiting)
    }
    
    func howToLaunchCellViewModel(for index: Int) -> ProductDetailHowToLaunchCellViewModelProtocol {
        let rule = launchRules[index]
        return ProductDetailHowToLaunchCellViewModel(rule: rule, serialNumber: index + 1)
    }
    
    func photoCellViewModel(for index: Int) -> ProductDetailPhotoCellViewModelProtocol {
        let photo = photos[index]
        return ProductDetailPhotoCellViewModel(photo: photo)
    }
    
    func getProductDetail(showLoader: Bool) {
        guard needsFetch else { return }
    }
    
    func saveVisitedProduct() {
        
    }
    
    func checkIfProductIsFavorite(showLoader: Bool) {
        
    }
    
    func handleFavoriteProduct() {
        
    }
    
    func newSectionTypeSelected(type: ProductDetailViewSection) {
        let sectionIndex = factory.sections.firstIndex(where: { $0.types.contains(type)})!
        factory.sections[sectionIndex].selectedType = type
        didUpdateSectionAtIndex.value = sectionIndex
    }
}
