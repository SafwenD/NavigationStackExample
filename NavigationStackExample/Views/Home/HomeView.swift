//
//  HomeView.swift
//  NavigationStackExample
//
//  Created by Safwen DEBBICHI on 21/05/2024.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.router) @Binding var router: Router
    var body: some View {
        ZStack {
            Color.purple.ignoresSafeArea()
            VStack {
                Text("Welcome Back")
                Button {
                    navigateBackToWelcome()
                } label: {
                    Text("Logout")
                }
            }
        }.navigationBarBackButtonHidden()
    }
    
    func navigateBackToWelcome() {
        router.path = NavigationPath()
    }
}

#Preview {
    HomeView()
}
