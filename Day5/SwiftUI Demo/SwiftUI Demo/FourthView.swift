//
//  FourthView.swift
//  SwiftUI Demo
//
//  Created by Eken Özlü on 27.10.2023.
//

import SwiftUI

struct FourthView: View {
    
    @State var labelText = "First Text"
    
    var body: some View {
        VStack{
            Text(labelText)
                .bold()
                .font(.largeTitle)
                .padding()
            
            Button("CHANGE") {
                if labelText == "First Text" {
                    labelText = "Second Text"
                } else {
                    labelText = "First Text"
                }
            }
        }
    }
}

#Preview {
    FourthView()
}
