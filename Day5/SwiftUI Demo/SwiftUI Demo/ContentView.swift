//
//  ContentView.swift
//  SwiftUI Demo
//
//  Created by Eken Özlü on 27.10.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            SecondView()
            UserListView()
            
            Text("Hello, world!")
                .bold()
                .padding()
            
            Text("Hello, world!")
                .font(.largeTitle)
            
            Text("Hello, world!")
                .multilineTextAlignment(.leading)
                .lineLimit(1)
            
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
        }
        .padding(10)
        .background(Color.gray)
    }
}

#Preview {
    ContentView()
}
