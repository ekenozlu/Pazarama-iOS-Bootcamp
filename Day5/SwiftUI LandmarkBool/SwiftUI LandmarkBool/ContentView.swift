//
//  ContentView.swift
//  SwiftUI LandmarkBool
//
//  Created by Eken Özlü on 27.10.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List(landmarkList) { landmark in
                    NavigationLink {
                        DetailView(selectedLandmark: landmark)
                    } label: {
                        HStack {
                            Image(landmark.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 30)
                            Text(landmark.name)
                        }
                    }
                }
            }.navigationTitle("Landmark Book").navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    ContentView()
}
