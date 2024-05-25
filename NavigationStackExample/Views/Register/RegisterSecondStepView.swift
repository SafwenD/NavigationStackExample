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
            Text("Step 2/4")
                .padding()
            TextField(text: _registrationContext.wrappedValue.applicant.lastname) {
                Text("LastName")
            }
            .padding(50)
            Button(action: {
                navigateToNextView()
            }, label: {
                Text("Go to step 3")
            }).padding()
            Button(action: {
                navigateBack()
            }, label: {
                Text("Back?")
            }).padding()
            Spacer()
            Text(registrationContext.applicant.description)
        }.navigationTitle("Registration 2/4")
    }
    
    func navigateBack() {
        router.path.removeLast()
    }
    
    func navigateToNextView() {
        router.path.append(RegistrationSubPath(step: .third(savePoint: registrationContext.applicant)))
    }
}

//struct RegisterSecondStepView: View {
//    @Binding var applicant: Applicant
//    @Binding var stepsStack: [RegisterStep]
//    @State var text: String = ""
//    var body: some View {
//        VStack {
//            Text("Step 2/4")
//                .padding()
//            TextField(text: $applicant.lastname) {
//                Text("LastName")
//            }
//            .padding(50)
//            Button(action: {
//                stepsStack.append(.third)
//            }, label: {
//                Text("Go to step 3")
//            }).padding()
//        }.onAppear {
//            print("Applicant : \(applicant)")
//        }
//        Spacer()
//    }
//}
