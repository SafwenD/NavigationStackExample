//
//  RegisterView.swift
//  NavigationStackExample
//
//  Created by Safwen DEBBICHI on 20/05/2024.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.router) @Binding var router: Router
    @Environment(\.registrationContext) @Binding var registrationContext: RegistrationContext
    var body: some View {
        VStack {
            Text("Registration !")
                .padding()
            Button {
                router.path.append(RegistrationSubPath(step: .first))
            } label: {
                Text("Start ...")
            }
        }
        .navigationTitle("Registration")
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

//struct RegisterView: View {
//    
//    @State var stepsStack: [RegisterStep] = []
//    @State var applicant: Applicant = .init()
//    
//    var body: some View {
//        NavigationStack(path: $stepsStack) {
//            VStack {
//                Text("Registration !")
//                    .padding()
//                NavigationLink("Start ...", value: RegisterStep.first)
//            }.navigationDestination(for: RegisterStep.self) { step in
//                switch step {
//                case .first: RegisterFirstStepView(applicant: $applicant, stepsStack: $stepsStack)
//                case .second: RegisterSecondStepView(applicant: $applicant, stepsStack: $stepsStack)
//                case .third: RegisterThirdStepView(applicant: $applicant, stepsStack: $stepsStack)
//                case .fourth: RegisterFourthStepView(applicant: $applicant, stepsStack: $stepsStack)
//                }
//            }
//        }
//    }
//}

#Preview {
    RegisterView()
}
