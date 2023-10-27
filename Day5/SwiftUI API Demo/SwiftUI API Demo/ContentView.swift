//
//  ContentView.swift
//  SwiftUI API Demo
//
//  Created by Eken Özlü on 27.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var cryptoListViewModel : CryptoListViewModel
    
    init() {
        self.cryptoListViewModel = CryptoListViewModel()
    }
    
    var body: some View {
        NavigationStack {
            List(cryptoListViewModel.cryptoList, id: \.id) { crypto in
                VStack {
                    Text(crypto.currency ?? "")
                        .font(.title).bold()
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .foregroundStyle(.blue)
                    Text(crypto.price ?? "")
                        .font(.title3)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .foregroundStyle(.black)
                }
            }.navigationTitle("Crpyto SwiftUI").navigationBarTitleDisplayMode(.inline)
        }.onAppear(perform: {
            cryptoListViewModel.downloadCurrencies(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        })
    }
}

#Preview {
    ContentView()
}
