//
//  ViewController.swift
//  CompositionalLayoutCarousel
//
//  Created by Shigenari Oshio on 2023/03/08.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout: UICollectionViewLayout = {
            let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
                return self.layoutSections[sectionIndex]
            }
            return layout
        }()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.register(CarouselContentCell.self, forCellWithReuseIdentifier: String(describing: CarouselContentCell.self))
        
        return collectionView
    }()
    
    private lazy var layoutSections: [NSCollectionLayoutSection] = [
        {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let width = view.frame.width - 16 * 2
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(width),
                                                   heightDimension: .absolute(width * 0.7))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

            let layoutSection = NSCollectionLayoutSection(group: group)
            layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
            layoutSection.interGroupSpacing = 8
            
            return layoutSection
        }(),
        
        {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            let width = view.frame.width * 0.6
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(width),
                                                   heightDimension: .absolute(width * 0.5))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

            let layoutSection = NSCollectionLayoutSection(group: group)
            layoutSection.orthogonalScrollingBehavior = .groupPaging
            layoutSection.interGroupSpacing = 8
            layoutSection.contentInsets = .init(top: 32, leading: 16, bottom: 0, trailing: 16)
            
            return layoutSection
        }(),
        
        {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            let width = view.frame.width * 0.4
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(width),
                                                   heightDimension: .absolute(width * 1.0))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

            let layoutSection = NSCollectionLayoutSection(group: group)
            layoutSection.orthogonalScrollingBehavior = .groupPaging
            layoutSection.interGroupSpacing = 8
            layoutSection.contentInsets = .init(top: 32, leading: 16, bottom: 0, trailing: 16)

            return layoutSection
        }()
    ]
    
    private let colors: [UIColor] = [.systemMint, .systemTeal, .systemCyan, .systemBlue, .systemIndigo]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        layoutSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CarouselContentCell.self), for: indexPath) as? CarouselContentCell
        else { return .init() }
        cell.configure(backgroundColor: colors[indexPath.row])
        return cell
    }
}
