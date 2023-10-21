//
//  ViewController.swift
//  MVVM Arch Demo
//
//  Created by Eken Özlü on 21.10.2023.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let activityIndicator = UIActivityIndicatorView()
    let cryptoTV = UITableView()
    let cryptoVM = CryptoViewModel()
    var cryptoList = [CryptoModel]()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        setupBindings()
        cryptoVM.requestData()
    }
    
    func createUI(){
        view.backgroundColor = .white
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .blue
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        cryptoTV.translatesAutoresizingMaskIntoConstraints = false
        cryptoTV.delegate = self
        cryptoTV.dataSource = self
        cryptoTV.backgroundColor = .white
        cryptoTV.rowHeight = 80
        cryptoTV.register(CryptoCell.self, forCellReuseIdentifier: "cryptoCell")
        cryptoTV.isHidden = true
        view.addSubview(cryptoTV)
        cryptoTV.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cryptoTV.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        cryptoTV.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cryptoTV.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    
    private func setupBindings() {
        cryptoVM.cryptoList.observe(on: MainScheduler.asyncInstance).subscribe { cryptoList in
            self.cryptoList = cryptoList
            self.cryptoTV.isHidden = false
            self.cryptoTV.reloadData()
        }.disposed(by: disposeBag)
        
        cryptoVM.error.observe(on: MainScheduler.asyncInstance).subscribe { error in
            print(error)
        }.disposed(by: disposeBag)
        
        cryptoVM.isLoading.bind(to: self.activityIndicator.rx.isAnimating).disposed(by: disposeBag)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCell", for: indexPath) as! CryptoCell
        cell.priceLabel.text = cryptoList[indexPath.row].price
        cell.nameLabel.text = cryptoList[indexPath.row].currency
        return cell
    }
    
}

