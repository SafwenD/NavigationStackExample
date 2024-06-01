//
//  LoginView.swift
//  NavigationStackExample
//
//  Created by Safwen DEBBICHI on 21/05/2024.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.router) @Binding var router: Router
    @State var text: String = ""
    var body: some View {
        VStack {
            TextField(text: $text) {
                Text("Password")
            }.textFieldStyle(.roundedBorder)
            .padding(50)
            Button {
                navigateToHome()
            } label: {
                Text("Login")
            }.padding()
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerSize: .init(width: 6, height: 6)))
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.pink.ignoresSafeArea())
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Login")
    }
    
    func navigateToHome() {
        router.setFullPath(components: [MainPath.home])
    }
}

#Preview {
    LoginView()
}
