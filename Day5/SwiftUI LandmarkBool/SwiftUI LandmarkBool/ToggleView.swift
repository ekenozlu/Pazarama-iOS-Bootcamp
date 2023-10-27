//
//  ToggleView.swift
//  SwiftUI LandmarkBool
//
//  Created by Eken Özlü on 27.10.2023.
//

import SwiftUI

struct ToggleView: View {
    
    @State var shown = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button("SHOW") {
            self.shown.toggle()
        }.sheet(isPresented: $shown, content: {
            DetailView(selectedLandmark: landmark1)
        })
    }
}

#Preview {
    ToggleView()
}


