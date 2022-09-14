//
//  ProductButtonBarPagerTabStripViewController.swift
//  feeria
//
//  Created by ios1 on 23.08.22.
//

import UIKit

class ProductButtonBarPagerTabStripViewController: PagerTabStripViewController, PagerTabStripDataSource, PagerTabStripDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    public var settings = ButtonBarPagerTabStripSettings()

    public var buttonBarItemSpec: ButtonBarItemSpec<ProductBarCell>!

    public var changeCurrentIndex: ((_ oldCell: ProductBarCell?, _ newCell: ProductBarCell?, _ animated: Bool) -> Void)?
    public var changeCurrentIndexProgressive: ((_ oldCell: ProductBarCell?, _ newCell: ProductBarCell?, _ progressPercentage: CGFloat, _ changeCurrentIndex: Bool, _ animated: Bool) -> Void)?
    
    private var needReloadDataAfterAnimation = false

    @IBOutlet public weak var buttonBarView: ButtonBarView!

    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        delegate = self
        datasource = self
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
        datasource = self
    }

    open override func viewDidLoad() {
        super.viewDidLoad()

        var bundle = Bundle(for: ProductBarCell.self)
        if let resourcePath = bundle.path(forResource: "XLPagerTabStrip", ofType: "bundle") {
            if let resourcesBundle = Bundle(path: resourcePath) {
                bundle = resourcesBundle
            }
        }

        buttonBarItemSpec = .nibFile(nibName: "ProductBarCell", bundle: bundle, width: { [weak self] (childItemInfo) -> CGFloat in
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = self?.settings.style.buttonBarItemFont
            label.text = childItemInfo.title
            let labelSize = label.intrinsicContentSize
            return labelSize.width + (self?.settings.style.buttonBarItemLeftRightMargin ?? 8) * 2
        })

        if buttonBarView.delegate == nil {
            buttonBarView.delegate = self
        }
        if buttonBarView.dataSource == nil {
            buttonBarView.dataSource = self
        }
        buttonBarView.scrollsToTop = false
        let flowLayout = buttonBarView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 2
        let sectionInset = flowLayout.sectionInset
        flowLayout.sectionInset = UIEdgeInsets(top: sectionInset.top, left: settings.style.buttonBarLeftContentInset ?? sectionInset.left, bottom: sectionInset.bottom, right: settings.style.buttonBarRightContentInset ?? sectionInset.right)

        buttonBarView.showsHorizontalScrollIndicator = false
        buttonBarView.backgroundColor = settings.style.buttonBarBackgroundColor ?? buttonBarView.backgroundColor

        // register button bar item cell
        switch buttonBarItemSpec! {
        case .nibFile(let nibName, let bundle, _):
            buttonBarView.register(UINib(nibName: nibName, bundle: bundle), forCellWithReuseIdentifier:"ProductBarCell")
        case .cellClass:
            buttonBarView.register(ProductBarCell.self, forCellWithReuseIdentifier:"ProductBarCell")
        }
        //-
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        buttonBarView.layoutIfNeeded()
    }

    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        guard isViewAppearing || isViewRotating else { return }

        // Force the UICollectionViewFlowLayout to get laid out again with the new size if
        // a) The view is appearing.  This ensures that
        //    collectionView:layout:sizeForItemAtIndexPath: is called for a second time
        //    when the view is shown and when the view *frame(s)* are actually set
        //    (we need the view frame's to have been set to work out the size's and on the
        //    first call to collectionView:layout:sizeForItemAtIndexPath: the view frame(s)
        //    aren't set correctly)
        // b) The view is rotating.  This ensures that
        //    collectionView:layout:sizeForItemAtIndexPath: is called again and can use the views
        //    *new* frame so that the buttonBarView cell's actually get resized correctly
        buttonBarView.collectionViewLayout.invalidateLayout()
        // When the view first appears or is rotated we also need to ensure that the barButtonView's
        // selectedBar is resized and its contentOffset/scroll is set correctly (the selected
        // tab/cell may end up either skewed or off screen after a rotation otherwise)
        buttonBarView.moveTo(index: currentIndex, animated: false, swipeDirection: .none, pagerScroll: .scrollOnlyIfOutOfScreen)
        buttonBarView.selectItem(at: IndexPath(item: currentIndex, section: 0), animated: false, scrollPosition: [])
    }

    // MARK: - Public Methods

    open override func reloadPagerTabStripView() {
        super.reloadPagerTabStripView()
        guard isViewLoaded else { return }
        buttonBarView.reloadData()
        buttonBarView.moveTo(index: currentIndex, animated: false, swipeDirection: .none, pagerScroll: .yes)
    }

    open func updateIndicator(for viewController: PagerTabStripViewController, fromIndex: Int, toIndex: Int) {
        guard shouldUpdateButtonBarView else { return }
        buttonBarView.moveTo(index: toIndex, animated: false, swipeDirection: toIndex < fromIndex ? .right : .left, pagerScroll: .yes)

        if let changeCurrentIndex = changeCurrentIndex {
            let oldIndexPath = IndexPath(item: currentIndex != fromIndex ? fromIndex : toIndex, section: 0)
            let newIndexPath = IndexPath(item: currentIndex, section: 0)

            let cells = cellForItems(at: [oldIndexPath, newIndexPath], reloadIfNotVisible: collectionViewDidLoad)
            changeCurrentIndex(cells.first!, cells.last!, true)
        }
    }

    open func updateIndicator(for viewController: PagerTabStripViewController, fromIndex: Int, toIndex: Int, withProgressPercentage progressPercentage: CGFloat, indexWasChanged: Bool) {
        guard shouldUpdateButtonBarView else { return }
        buttonBarView.move(fromIndex: fromIndex, toIndex: toIndex, progressPercentage: progressPercentage, pagerScroll: .yes)
        if let changeCurrentIndexProgressive = changeCurrentIndexProgressive {
            let oldIndexPath = IndexPath(item: currentIndex != fromIndex ? fromIndex : toIndex, section: 0)
            let newIndexPath = IndexPath(item: currentIndex, section: 0)

            let cells = cellForItems(at: [oldIndexPath, newIndexPath], reloadIfNotVisible: collectionViewDidLoad)
            changeCurrentIndexProgressive(cells.first!, cells.last!, progressPercentage, indexWasChanged, true)
        }
    }

    open func updateData() {
        if shouldUpdateButtonBarView {
            self.buttonBarView.reloadData()
        } else {
            needReloadDataAfterAnimation = true
        }
    }
    
    private func cellForItems(at indexPaths: [IndexPath], reloadIfNotVisible reload: Bool = true) -> [ProductBarCell?] {
        let cells = indexPaths.map { buttonBarView.cellForItem(at: $0) as? ProductBarCell }

        if reload {
            let indexPathsToReload = cells.enumerated()
                .compactMap { (arg) -> IndexPath? in
                    let (index, cell) = arg
                    return cell == nil ? indexPaths[index] : nil
                }
                .compactMap { (indexPath: IndexPath) -> IndexPath? in
                    return (indexPath.item >= 0 && indexPath.item < buttonBarView.numberOfItems(inSection: indexPath.section)) ? indexPath : nil
                }

            if !indexPathsToReload.isEmpty {
                buttonBarView.reloadItems(at: indexPathsToReload)
            }
        }

        return cells
    }

    // MARK: - UICollectionViewDelegateFlowLayut

    @objc open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.height, height: collectionView.frame.size.height)
    }

    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.item != currentIndex else { return }

        buttonBarView.moveTo(index: indexPath.item, animated: true, swipeDirection: .none, pagerScroll: .yes)
        shouldUpdateButtonBarView = false

        let oldIndexPath = IndexPath(item: currentIndex, section: 0)
        let newIndexPath = IndexPath(item: indexPath.item, section: 0)

        let cells = cellForItems(at: [oldIndexPath, newIndexPath], reloadIfNotVisible: collectionViewDidLoad)

        if pagerBehaviour.isProgressiveIndicator {
            if let changeCurrentIndexProgressive = changeCurrentIndexProgressive {
                changeCurrentIndexProgressive(cells.first!, cells.last!, 1, true, true)
            }
        } else {
            if let changeCurrentIndex = changeCurrentIndex {
                changeCurrentIndex(cells.first!, cells.last!, true)
            }
        }
        moveToViewController(at: indexPath.item, animated: true)
    }

    // MARK: - UICollectionViewDataSource

    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewControllers.count
    }

    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductBarCell", for: indexPath) as? ProductBarCell else {
            fatalError("UICollectionViewCell should be or extend from ListClientInfoCell")
        }
        
        collectionViewDidLoad = true

//        let childController = viewControllers[indexPath.item] as! IndicatorInfoProvider // swiftlint:disable:this force_cast
//        let indicatorInfo = childController.indicatorInfo(for: self)
//
        configureCell(cell, indicatorInfo: IndicatorInfo(title: "TEST"), indexPath: indexPath)

        if pagerBehaviour.isProgressiveIndicator {
            if let changeCurrentIndexProgressive = changeCurrentIndexProgressive {
                changeCurrentIndexProgressive(currentIndex == indexPath.item ? nil : cell, currentIndex == indexPath.item ? cell : nil, 1, true, false)
            }
        } else {
            if let changeCurrentIndex = changeCurrentIndex {
                changeCurrentIndex(currentIndex == indexPath.item ? nil : cell, currentIndex == indexPath.item ? cell : nil, false)
            }
        }
        return cell
    }

    // MARK: - UIScrollViewDelegate
    
    open override func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        super.scrollViewDidEndScrollingAnimation(scrollView)

        guard scrollView == containerView else { return }
        shouldUpdateButtonBarView = true
        if needReloadDataAfterAnimation {
            needReloadDataAfterAnimation = false
            self.buttonBarView.reloadData()
        }
    }

    open func configureCell(_ cell: ProductBarCell, indicatorInfo: IndicatorInfo, indexPath: IndexPath) {
    }

    private var shouldUpdateButtonBarView = true
    private var collectionViewDidLoad = false

}
