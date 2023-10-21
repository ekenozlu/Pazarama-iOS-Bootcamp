//
//  CryptoViewModel.swift
//  MVVM Arch Demo
//
//  Created by Eken Özlü on 21.10.2023.
//

import Foundation
import RxSwift
import RxCocoa

class CryptoViewModel {
    
    let cryptoList : PublishSubject<[CryptoModel]> = PublishSubject()
    let error : PublishSubject<String> = PublishSubject()
    let isLoading : PublishSubject<Bool> = PublishSubject()
    
    func requestData() {
        self.isLoading.onNext(true)
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            WebService().downloadCurrencies(url: url!) { result in
                self.isLoading.onNext(false)
                switch result {
                case .success(let model):
                    print(model)
                    self.cryptoList.onNext(model)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}

