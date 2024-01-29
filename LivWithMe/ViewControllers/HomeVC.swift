//
//  HomeVC.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 26/01/2024.
//

import UIKit

protocol HomeVCDelegate: AnyObject {
    func didSwipeRight()
    func didSwipeLeft()
}

class HomeVC: UIViewController {
    private var selectedFilterIndex: Int = 0
    var coordinator: Coordinator?
    weak var delegate: HomeVCDelegate!
    
    private lazy var homeScreenView: HomeScreenView = {
        let view = HomeScreenView(dataSource: self, delegate: self)
        
        // custom cells
        view.register(CategoryViewCell.self, forCellWithReuseIdentifier: "\(CategoryViewCell.self)")
        view.register(NearFromYouHomeCell.self, forCellWithReuseIdentifier: "\(NearFromYouHomeCell.self)")
        view.register(BestForYouHomeCell.self, forCellWithReuseIdentifier: "\(BestForYouHomeCell.self)")
        
        // headers
        view.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(SectionHeaderView.self)")
        view.register(SearchHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(SearchHeaderView.self)")
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appTheme.background
        setupViews()
        setupSwipeGestures()
    }
    
    @objc private func didSwipeToRight() {
        delegate?.didSwipeRight()
    }
    
    @objc private func didSwipeToLeft() {
        delegate?.didSwipeLeft()
    }
    
    private func setupSwipeGestures() {
        let rightSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeToRight))
        let leftSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeToLeft))
        rightSwipeGestureRecognizer.direction = .right
        leftSwipeGestureRecognizer.direction = .left
        view.addGestureRecognizer(rightSwipeGestureRecognizer)
        view.addGestureRecognizer(leftSwipeGestureRecognizer)
    }
    
    private func setupViews() {
        view.addSubview(homeScreenView)
        view.layer.cornerRadius = 20
        
        homeScreenView.layer.cornerRadius = 20
        NSLayoutConstraint.activate([
            homeScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeScreenView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            homeScreenView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}



// MARK: UICollectionViewDataSource configuration
extension HomeVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return MockData.filters.count
        } else {
            return MockData.homes.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CategoryViewCell.self)", for: indexPath) as! CategoryViewCell
            cell.isSelected = selectedFilterIndex == indexPath.item
            cell.configure(MockData.filters[indexPath.item])
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(NearFromYouHomeCell.self)", for: indexPath) as! NearFromYouHomeCell
            cell.configure(MockData.homes[indexPath.item])
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(BestForYouHomeCell.self)", for: indexPath) as! BestForYouHomeCell
            cell.configure(MockData.homes[indexPath.item])
            return cell
        default:
            assert(false, "Invalid Element Type")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            if indexPath.section == 0 {
                return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(SearchHeaderView.self)", for: indexPath) as! SearchHeaderView
            }
            else if indexPath.section == 1 {
                let headerView =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(SectionHeaderView.self)", for: indexPath) as! SectionHeaderView
                headerView.label.text = "Near From You"
                return headerView
            }
            else {
                let headerView =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(SectionHeaderView.self)", for: indexPath) as! SectionHeaderView
                headerView.label.text = "Best for you"
                return headerView
            }
        default:
            assert(false, "Invalid Element Type")
        }
    }
}

// MARK: UICollectionViewDelegate configuration
extension HomeVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            selectedFilterIndex = indexPath.item
        } else {
            let homeItem = MockData.homes[indexPath.item]
            coordinator?.didTapHome(home: homeItem)
        }
    }
}

