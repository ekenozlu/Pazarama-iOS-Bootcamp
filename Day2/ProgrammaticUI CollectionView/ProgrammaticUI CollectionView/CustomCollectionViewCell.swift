//
//  CustomCollectionViewCell.swift
//  ProgrammaticUI CollectionView
//
//  Created by Eken Özlü on 15.10.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    let simpsonImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let jobLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func addViews() {
        backgroundColor = .clear
        
        addSubview(simpsonImageView)
        simpsonImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        simpsonImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        simpsonImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        simpsonImageView.heightAnchor.constraint(equalTo: simpsonImageView.widthAnchor, multiplier: 1.0).isActive = true
        
        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: simpsonImageView.bottomAnchor,constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: simpsonImageView.leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: simpsonImageView.rightAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(jobLabel)
        jobLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        jobLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        jobLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        jobLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
