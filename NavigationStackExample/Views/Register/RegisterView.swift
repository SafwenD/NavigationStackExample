//
//  RegisterView.swift
//  NavigationStackExample
//
//  Created by Safwen DEBBICHI on 20/05/2024.
//

import SwiftUI

let kRegistrationSavePointKey = "registration"

struct RegisterView: View {
    @Environment(\.router) @Binding var router: Router
    @Environment(\.registrationContext) @Binding var registrationContext: RegistrationContext
    var body: some View {
        VStack {
            Button {
                router.push(component: RegistrationSubPath(step: .first))
            } label: {
                Text("Start")
                    .foregroundStyle(.white)
            }.padding()
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerSize: .init(width: 6, height: 6)))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.cyan.ignoresSafeArea())
        .navigationTitle("Registration")
        .navigationBarTitleDisplayMode(.large)
        .navigationDestination(for: RegistrationSubPath.self) { path in
            switch path.step {
            case .first: RegisterFirstStepView()
            case .second: RegisterSecondStepView()
            case .third(let applicant): RegisterThirdStepView(applicant: applicant)
            case .fourth: RegisterFourthStepView()
            }
        }
    }
}


#Preview {
    RegisterView()
}
