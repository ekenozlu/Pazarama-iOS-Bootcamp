//
//  DetailView.swift
//  SwiftUI LandmarkBool
//
//  Created by Eken Özlü on 27.10.2023.
//

import SwiftUI

struct DetailView: View {
    
    let selectedLandmark : Landmark
    
    var body: some View {
        VStack {
            Image(selectedLandmark.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(15)
            Text(selectedLandmark.name)
                .font(.largeTitle)
                .bold()
            Text(selectedLandmark.country)
                .font(.title)
            Text(selectedLandmark.year)
                .font(.title3)
            
        }
    }
}

#Preview {
    DetailView(selectedLandmark: landmark1)
}
