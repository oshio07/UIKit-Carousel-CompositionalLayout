//
//  ViewController.swift
//  CompositionalLayoutCarousel
//
//  Created by Shigenari Oshio on 2023/03/08.
//

import UIKit

final class ViewController: UIViewController {
    
    private let sections: [Section] = [
        .large,
        .landscape,
        .square
    ]
    
    private lazy var collectionView: UICollectionView = {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 32
        
        let collectionViewLayout = UICollectionViewCompositionalLayout(
            sectionProvider: { [weak self] (index, environment) in
                guard let self else { return nil }
                return self.sections[index].layoutSection(frame: self.view.frame)
            },
            configuration: config
        )

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.register(CarouselContentCell.self, forCellWithReuseIdentifier: String(describing: CarouselContentCell.self))
        
        return collectionView
    }()
    
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
        sections.count
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
