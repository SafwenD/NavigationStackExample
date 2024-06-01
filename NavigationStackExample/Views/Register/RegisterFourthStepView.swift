//
//  RegisterFourthStepView.swift
//  NavigationStackExample
//
//  Created by Safwen DEBBICHI on 20/05/2024.
//

import SwiftUI

struct RegisterFourthStepView: View {
    @Environment(\.router) @Binding var router: Router
    @Environment(\.registrationContext) @Binding var registrationContext: RegistrationContext
    var body: some View {
        VStack {
            TextField(text: _registrationContext.wrappedValue.applicant.country) {
                Text("Country")
            }.textFieldStyle(.roundedBorder)
            .padding(50)
            Spacer()
            Button(action: {
                navigateToLogin()
            }, label: {
                Text("Finish")
            }).padding()
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerSize: .init(width: 6, height: 6)))
            Button(action: {
                navigateBack()
            }, label: {
                Text("Back")
            }).padding()
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerSize: .init(width: 6, height: 6)))
            Button(action: {
                navigateBackToStep()
            }, label: {
                Text("Go Back to step 2")
            }).padding()
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerSize: .init(width: 6, height: 6)))
            Button(action: {
                router.popToRoot()
            }, label: {
                Text("Go Back To Welcome")
            }).padding()
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerSize: .init(width: 6, height: 6)))
            Spacer()
            Text(registrationContext.applicant.description)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.green.ignoresSafeArea())
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Registration 4/4")
    }
    
    func navigateBack() {
        router.pop()
    }
    
    func navigateBackToStep() {
        router.pop(count: 2)
    }
    
    func navigateBackToWelcome() {
        router.popToRoot()
    }
    
    func navigateToLogin() {
        router.setFullPath(components: [WelcomePath.login])
    }
}
