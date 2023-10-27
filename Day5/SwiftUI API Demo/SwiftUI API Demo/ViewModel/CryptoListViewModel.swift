//
//  CryptoViewModel.swift
//  SwiftUI API Demo
//
//  Created by Eken Özlü on 27.10.2023.
//

import Foundation

class CryptoListViewModel : ObservableObject {
    
    @Published var cryptoList = [CryptoViewModel]()
    @Published var errorMessage = ""
    
    let webService = WebService()
    
    func downloadCurrenciesAsync(url : URL) async {
        do {
            let cryptoList = try await webService.downloadCurrenciesAsync(url: url)
            DispatchQueue.main.async {
                self.cryptoList = cryptoList.map(CryptoViewModel.init)
            }
            
        } catch {
            //
        }
    }
    
    func downloadCurrencies(url: URL){
        webService.downloadCurrencies(url: url) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.cryptoList = response.map(CryptoViewModel.init)
                }
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}

struct CryptoViewModel {
    let crypto : CryptoModel
    
    var id : String? {
        crypto.id
    }
    
    var currency : String? {
        crypto.currency
    }
    
    var price : String? {
        crypto.price
    }
    
}
