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
            }.padding(50)
            Button {
                navigateToHome()
            } label: {
                Text("Login")
            }
        }
        // DOESNT WORK !!!!
//        .navigationDestination(for: MainPath.self) { path in
//            switch path {
//            case .home: HomeView()
//            }
//        }
    }
    
    func navigateToHome() {
        router.path = NavigationPath([MainPath.home])
    }
}

#Preview {
    LoginView()
}
