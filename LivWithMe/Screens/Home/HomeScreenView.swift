//
//  HomeScreen.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 26/01/2024.
//

import UIKit

class HomeScreenView: UICollectionView {
    
    init(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate) {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionViewLayout = makeCompositionalLayout()
        self.dataSource = dataSource
        self.delegate = delegate
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeCompositionalLayout() -> UICollectionViewCompositionalLayout {
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
}
