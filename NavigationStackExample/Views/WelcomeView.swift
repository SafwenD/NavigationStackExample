//
//  WelcomeView.swift
//  NavigationStackExample
//
//  Created by Safwen DEBBICHI on 20/05/2024.
//

import SwiftUI

struct WelcomeView: View {
    @Environment(\.router) @Binding var router: Router
    var body: some View {
        NavigationStack(path: _router.wrappedValue.path) {
            VStack {
                Button(action: {
                    navigateToLogin()
                }, label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                }).frame(maxWidth: .infinity)
                .background(Color.blue.cornerRadius(8))
                .padding()
                Button(action: {
                    navigateToRegistration()
                }, label: {
                    Text("Register")
                        .foregroundColor(.white)
                        .padding()
                }).frame(maxWidth: .infinity)
                    .background(Color.blue.cornerRadius(8))
                    .padding()
            }
            .onAppear {
                navigateToSavePoint()
            }
            .navigationDestination(for: WelcomePath.self) { path in
                switch path {
                case .login: LoginView()
                case .registration: RegisterView()
                }
            }
            .navigationDestination(for: MainPath.self) { path in
                switch path {
                case .home: HomeView()
                }
            }
        }.modifier(DynamicEnvironmentModifier(keyPath: \.registrationContext, proxy: .init(applicant: .init())))
    }
    
    func navigateToLogin() {
        router.push(component: WelcomePath.login)
    }
    
    func navigateToRegistration() {
        router.push(component: WelcomePath.registration)
    }
    
    func navigateToSavePoint() {
        router.load(forKey: kRegistrationSavePointKey)
    }
}

#Preview {
    WelcomeView()
}
