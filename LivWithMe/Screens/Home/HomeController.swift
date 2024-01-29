//
//  HomeController.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 15/01/2024.
//


import UIKit

class HomeController: UICollectionViewController, Coordinating {
    private var selectedFilterIndex: Int = 0
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = layout()
        collectionView.backgroundColor = .appTheme.background
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // custom cells
        collectionView.register(CategoryViewCell.self, forCellWithReuseIdentifier: "\(CategoryViewCell.self)")
        collectionView.register(NearFromYouHomeCell.self, forCellWithReuseIdentifier: "\(NearFromYouHomeCell.self)")
        collectionView.register(BestForYouHomeCell.self, forCellWithReuseIdentifier: "\(BestForYouHomeCell.self)")
        
        // headers
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(SectionHeaderView.self)")
        collectionView.register(SearchHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(SearchHeaderView.self)")
    }
    
    
    func layout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, _) -> NSCollectionLayoutSection? in
            // MARK: Home Categories Section
            if sectionIndex == 0 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .estimated(35))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .estimated(50))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(120))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 12
                section.orthogonalScrollingBehavior = .continuous
                section.boundarySupplementaryItems = [sectionHeader]
                section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 16 , bottom: 32, trailing: 16)
                return section
            }
            else if sectionIndex == 1 {
                // MARK: Near From You Section
                let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(230), heightDimension: .absolute(270))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .estimated(200))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 24
                section.boundarySupplementaryItems = [sectionHeader]
                section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 16, bottom: 32, trailing: 16)
                return section
            }
            else if sectionIndex == 2 {
                // MARK: Best for you section
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 13
                section.boundarySupplementaryItems = [sectionHeader]
                section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 16, bottom: 32, trailing: 16)
                return section
            }
            return nil
        }
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return MockData.filters.count
        } else {
            return MockData.homes.count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CategoryViewCell.self)", for: indexPath) as! CategoryViewCell
            cell.configure(MockData.filters[indexPath.item], isCategorySelected: selectedFilterIndex == indexPath.item)
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            selectedFilterIndex = indexPath.item
            collectionView.reloadData()
        } else {
            let homeItem = MockData.homes[indexPath.item]
            coordinator?.didTapHome(home: homeItem)
        }
    }
    
    override  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
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
