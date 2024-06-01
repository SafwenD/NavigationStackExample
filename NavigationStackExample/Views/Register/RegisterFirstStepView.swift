//
//  RegisterFirstStepView.swift
//  NavigationStackExample
//
//  Created by Safwen DEBBICHI on 20/05/2024.
//

import SwiftUI

struct RegisterFirstStepView: View {
    @Environment(\.router) @Binding var router: Router
    @Environment(\.registrationContext) @Binding var registrationContext: RegistrationContext
    var body: some View {
        VStack {
            TextField(text: _registrationContext.wrappedValue.applicant.firstname) {
                Text("FirstName")
            }.textFieldStyle(.roundedBorder)
            .padding(50)
            Spacer()
            Button(action: {
                navigateToNextView()
            }, label: {
                Text("Next")
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
            Spacer()
            Text(registrationContext.applicant.description)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow.ignoresSafeArea())
        .navigationTitle("Registration 1/4")
        .navigationBarTitleDisplayMode(.large)
    }
    
    func navigateBack() {
        router.pop()
    }
    
    func navigateToNextView() {
        router.push(component: RegistrationSubPath(step: .second))
    }
}
