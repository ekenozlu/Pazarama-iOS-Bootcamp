//
//  CryptoCell.swift
//  MVVM Arch Demo
//
//  Created by Eken Özlü on 21.10.2023.
//

import UIKit

class CryptoCell: UITableViewCell {
    
    let priceLabel = UILabel()
    let nameLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createUI() {
        contentView.backgroundColor = .clear
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.layer.cornerRadius = 8
        contentView.addSubview(view)
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 4).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -4).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -4).isActive = true
        view.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 4).isActive = true
        
        priceLabel.font = .systemFont(ofSize: 22, weight: .black)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.textColor = .white
        priceLabel.textAlignment = .left
        priceLabel.numberOfLines = 1
        view.addSubview(priceLabel)
        priceLabel.bottomAnchor.constraint(equalTo: view.centerYAnchor,constant: -4).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        
        nameLabel.font = .systemFont(ofSize: 18, weight: .regular)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .white
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 1
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 4).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor).isActive = true
    }
    
}
