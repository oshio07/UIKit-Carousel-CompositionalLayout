//
//  CarouselContentCell.swift
//  CompositionalLayoutCarousel
//
//  Created by Shigenari Oshio on 2023/03/08.
//

import UIKit

final class CarouselContentCell: UICollectionViewCell {
    
    private lazy var carouselContentView: UIView = {
        let carouselContentView = UIView()
        carouselContentView.translatesAutoresizingMaskIntoConstraints = false
        carouselContentView.layer.cornerRadius = 16
        return carouselContentView
    }()
    
    func configure(backgroundColor: UIColor) {
        carouselContentView.backgroundColor = backgroundColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(carouselContentView)
        
        NSLayoutConstraint.activate([
            carouselContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            carouselContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            carouselContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            carouselContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
