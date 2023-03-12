//
//  Section.swift
//  CompositionalLayoutCarousel
//
//  Created by Shigenari Oshio on 2023/03/12.
//

import UIKit

enum Section {
    
    case large, landscape, square
    
    private var horizontalInset: CGFloat { 16 }
    
    func layoutSection(frame: CGRect) -> NSCollectionLayoutSection {
        switch self {
        case .large:
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let width = frame.width - horizontalInset * 2
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(width),
                                                   heightDimension: .absolute(width * 0.7))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let layoutSection = NSCollectionLayoutSection(group: group)
            layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
            layoutSection.interGroupSpacing = 8
            
            return layoutSection
            
        case .landscape:
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6),
                                                   heightDimension: .fractionalWidth(0.6 / 2))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let layoutSection = NSCollectionLayoutSection(group: group)
            layoutSection.orthogonalScrollingBehavior = .groupPaging
            layoutSection.interGroupSpacing = 8
            layoutSection.contentInsets = .init(top: 0, leading: horizontalInset, bottom: 0, trailing: horizontalInset)
            
            return layoutSection
            
        case .square:
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4),
                                                   heightDimension: .fractionalWidth(0.4))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let layoutSection = NSCollectionLayoutSection(group: group)
            layoutSection.orthogonalScrollingBehavior = .groupPaging
            layoutSection.interGroupSpacing = 8
            layoutSection.contentInsets = .init(top: 0, leading: horizontalInset, bottom: 0, trailing: horizontalInset)
            
            return layoutSection
        }
    }
}
