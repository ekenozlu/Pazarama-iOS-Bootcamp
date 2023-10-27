//
//  SecondView.swift
//  SwiftUI Demo
//
//  Created by Eken Özlü on 27.10.2023.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        Image("image")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.3)
    }
}

#Preview {
    SecondView()
}
