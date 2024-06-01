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
            TextField(text: _registrationContext.wrappedValue.applicant.age) {
                Text("Age")
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
            Button {
                saveProgress()
            } label: {
                Text("Save Progress")
            }.padding()
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerSize: .init(width: 6, height: 6)))
            Button {
                clearProgress()
            } label: {
                Text("Clear Progress")
            }.padding()
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerSize: .init(width: 6, height: 6)))
            Spacer()
            Text(registrationContext.applicant.description)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.purple.ignoresSafeArea())
            .navigationBarTitleDisplayMode(.large)
        .navigationTitle("Registration 3/4")
        .onAppear {
            if let applicant {
                registrationContext.applicant = applicant
            }
        }
    }
    
    func saveProgress() {
        router.save(forKey: kRegistrationSavePointKey)
    }
    
    func clearProgress() {
        router.removeSave(forKey: kRegistrationSavePointKey)
        router.popToRoot()
    }
    
    func navigateBack() {
        router.pop()
    }
    
    func navigateToNextView() {
        router.push(component: RegistrationSubPath(step: .fourth))
    }
}


