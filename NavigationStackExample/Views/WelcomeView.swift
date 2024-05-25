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
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                    .padding(.bottom, 100)
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
        router.path.append(WelcomePath.login)
    }
    
    func navigateToRegistration() {
        router.path.append(WelcomePath.registration)
    }
    
    func navigateToSavePoint() {
        guard let path = SavePoint.registration.load() else { return }
        router.path = path
    }
}

#Preview {
    WelcomeView()
}
