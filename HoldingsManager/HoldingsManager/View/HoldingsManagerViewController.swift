//
//  HoldingsManagerViewController.swift
//  HoldingsManager
//
//  Created by Apoorv Joshi on 16/11/24.
//

import UIKit
import Foundation

class HoldingsManagerViewController: UIViewController {
    
    private var bottomTabView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 226.0/255.0, green: 226.0/255.0, blue: 226.0/255.0, alpha: 255.0/255.0)

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    private let bottomSheet = HoldingsValueBottomsheet()
        
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var dataSource: UICollectionViewDiffableDataSource<Int, UserHolding>?
    private var viewModel = UserHoldingsViewModel()

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupDataSource()
        fetchData()
    }
    
    // MARK: - Setup Methods
    private func setupCollectionView() {
        view.addSubview(bottomTabView)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.width, height: 60)
        layout.minimumLineSpacing = 5
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor =  UIColor(red: 252/255.0, green: 252/255.0, blue: 252/255.0, alpha: 1.0)
        collectionView.register(HoldingsCell.self, forCellWithReuseIdentifier: HoldingsCell.reuseIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
        
        view.addSubview(collectionView)
                
        NSLayoutConstraint.activate([
            bottomTabView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomTabView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomTabView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomTabView.heightAnchor.constraint(equalToConstant: 50),
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomTabView.topAnchor)
        ])
        
        view.addSubview(bottomSheet)
        bottomSheet.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            bottomSheet.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomSheet.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomSheet.bottomAnchor.constraint(equalTo: bottomTabView.topAnchor)
        ])
        
        bottomSheet.configure(currentValue: viewModel.calculateCurrentValue(), totalInvestment: viewModel.calculateTotalInvestment(), todaysPNL: viewModel.calculateTodaysPNL(), totalPNL: viewModel.calculateTotalPNL())
    }
    
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, UserHolding>(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HoldingsCell.reuseIdentifier, for: indexPath) as? HoldingsCell else { return nil }
            
            cell.configure(with: item.symbol, netQuantity: item.quantity, pnl: (item.close - item.ltp) * Double(item.quantity), ltp: item.ltp)
            return cell
        }
    }
    
    // MARK: - Fetch and Apply Data
    private func fetchData() {
        self.applySnapshot()
//        viewModel.fetchUserHoldings { [weak self] success in
//            if success {
//                self?.applySnapshot() // Refresh the collection view
//            } else {
//                print("Failed to fetch data.")
//            }
//        }
    }
    
    private func applySnapshot() {
        let holdings = viewModel.mockUserHoldings
        
        var snapshot = NSDiffableDataSourceSnapshot<Int, UserHolding>()
        snapshot.appendSections([0])
        snapshot.appendItems(holdings, toSection: 0)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}

