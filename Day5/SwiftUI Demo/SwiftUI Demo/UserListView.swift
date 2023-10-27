//
//  UserListView.swift
//  SwiftUI Demo
//
//  Created by Eken Özlü on 27.10.2023.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        VStack{
            List(userList, id: \.self) { user in
                Text(user.name)
            }
            
            List(userList) { user in
                HStack {
                    Image("image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    Text(user.name)
                }
            }
            List {
                ForEach(userList) { user in
                    Text(user.id).font(.system(size: 13))
                }
            }
        }
    }
}

#Preview {
    UserListView()
}
