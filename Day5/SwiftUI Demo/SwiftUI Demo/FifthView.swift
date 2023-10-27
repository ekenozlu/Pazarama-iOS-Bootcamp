//
//  FifthView.swift
//  SwiftUI Demo
//
//  Created by Eken Özlü on 27.10.2023.
//

import SwiftUI

struct FifthView: View {
    
    @State var name = "Eken"
    
    var body: some View {
        VStack {
            Text(name)
                .font(.largeTitle)
                .padding()
            TextField("Enter your name", text: $name).padding().background(Color.gray)
            
            Button("CHANGE") {
                self.name = "changed"
            }
        }
    }
}

#Preview {
    FifthView()
}
