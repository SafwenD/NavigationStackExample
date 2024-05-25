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
            Text("Step 1/4")
                .padding()
            TextField(text: _registrationContext.wrappedValue.applicant.firstname) {
                Text("FirstName")
            }
            .padding(50)
            Button(action: {
                navigateToNextView()
            }, label: {
                Text("Go to step 2")
            }).padding()
            Button(action: {
                navigateBack()
            }, label: {
                Text("Back?")
            }).padding()
            Spacer()
            Text(registrationContext.applicant.description)
        }.navigationTitle("Registration 1/4")
    }
    
    func navigateBack() {
        router.path.removeLast()
    }
    
    func navigateToNextView() {
        router.path.append(RegistrationSubPath(step: .second))
    }
}

//struct RegisterFirstStepView: View {
//    @Binding var applicant: Applicant
//    @Binding var stepsStack: [RegisterStep]
//    @State var text: String = ""
//    var body: some View {
//        VStack {
//            Text("Step 1/4")
//                .padding()
//            TextField(text: $applicant.firstname) {
//                Text("FirstName")
//            }
//            .padding(50)
//            Button(action: {
//                stepsStack.append(.second)
//            }, label: {
//                Text("Go to step 2")
//            }).padding()
//        }
//        .onAppear {
//            print("Applicant : \(applicant)")
//        }
//        Spacer()
//    }
//}
