//
//  RegisterThirdStepView.swift
//  NavigationStackExample
//
//  Created by Safwen DEBBICHI on 20/05/2024.
//

import SwiftUI

struct RegisterThirdStepView: View {
    @Environment(\.router) @Binding var router: Router
    @Environment(\.registrationContext) @Binding var registrationContext: RegistrationContext
    var applicant: Applicant?
    var body: some View {
        VStack {
            Text("Step 3/4")
                .padding()
            TextField(text: _registrationContext.wrappedValue.applicant.age) {
                Text("Age")
            }
            .padding(50)
            Button(action: {
                navigateToNextView()
            }, label: {
                Text("Go to step 4")
            }).padding()
            Button(action: {
                navigateBack()
            }, label: {
                Text("Back?")
            }).padding()
            Spacer()
            Button {
                saveProgress()
            } label: {
                Text("Save Progress")
            }
            Button {
                clearProgress()
            } label: {
                Text("Clear Progress")
            }
            Spacer()
            Text(registrationContext.applicant.description)
        }
        .navigationTitle("Registration 3/4")
        .onAppear {
            if let applicant {
                registrationContext.applicant = applicant
            }
        }
    }
    
    func saveProgress() {
        SavePoint.registration.save(path: router.path)
    }
    
    func clearProgress() {
        SavePoint.registration.removeSave()
        router.path = NavigationPath()
    }
    
    func navigateBack() {
        router.path.removeLast()
    }
    
    func navigateToNextView() {
        router.path.append(RegistrationSubPath(step: .fourth))
    }
}

//struct RegisterThirdStepView: View {
//    @Binding var applicant: Applicant
//    @Binding var stepsStack: [RegisterStep]
//    var body: some View {
//        VStack {
//            Text("Step 3/4")
//                .padding()
//            TextField(text: $applicant.age) {
//                Text("Age")
//            }
//            .padding(50)
//            Button(action: {
//                stepsStack.append(.fourth)
//            }, label: {
//                Text("Go to step 4")
//            }).padding()
//        }.onAppear {
//            print("Applicant : \(applicant)")
//        }
//        Spacer()
//    }
//}
