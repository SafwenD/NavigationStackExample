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
            Text("Step 4/4")
                .padding()
            TextField(text: _registrationContext.wrappedValue.applicant.country) {
                Text("Country")
            }
            .padding(50)
            Button(action: {
                navigateToLogin()
            }, label: {
                Text("Next")
            }).padding()
            Button(action: {
                navigateBack()
            }, label: {
                Text("Back?")
            }).padding()
            Button(action: {
                navigateBackToStep(number: 2)
            }, label: {
                Text("Go Back to step 2")
            }).padding()
            Button(action: {
                router.path = NavigationPath()
            }, label: {
                Text("Go Back To Welcome")
            }).padding()
            Spacer()
            Text(registrationContext.applicant.description)
        }.navigationTitle("Registration 4/4")
    }
    
    func navigateBack() {
        router.path.removeLast()
    }
    
    func navigateBackToStep(number: Int) {
        router.path.removeLast(RegisterStep.count - number)
    }
    
    func navigateBackToWelcome() {
        router.path = NavigationPath()
    }
    
    func navigateToLogin() {
        router.path = NavigationPath([WelcomePath.login])
    }
}

//struct RegisterFourthStepView: View {
//    @Binding var applicant: Applicant
//    @Binding var stepsStack: [RegisterStep]
//    var body: some View {
//        VStack {
//            Text("Step 4/4")
//                .padding()
//            TextField(text: $applicant.country) {
//                Text("Country")
//            }
//            .padding(50)
//            Button(action: {
//                stepsStack = [.first, .second]
//            }, label: {
//                Text("Go Back to step 2")
//            }).padding()
//        }.onAppear {
//            print("Applicant : \(applicant)")
//        }
//        Spacer()
//    }
//}
