//
//  RegisterSecondStepView.swift
//  NavigationStackExample
//
//  Created by Safwen DEBBICHI on 20/05/2024.
//

import SwiftUI

struct RegisterSecondStepView: View {
    @Environment(\.router) @Binding var router: Router
    @Environment(\.registrationContext) @Binding var registrationContext: RegistrationContext
    var body: some View {
        VStack {
            TextField(text: _registrationContext.wrappedValue.applicant.lastname) {
                Text("LastName")
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
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red.ignoresSafeArea())
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Registration 2/4")
    }
    
    func navigateBack() {
        router.pop()
    }
    
    func navigateToNextView() {
        router.push(component: RegistrationSubPath(step: .third(savePoint: registrationContext.applicant)))
    }
}
