//
//  RegistrationContext.swift
//  NavigationStackExample
//
//  Created by Safwen DEBBICHI on 21/05/2024.
//

import SwiftUI

struct RegistrationContext: DynamicEnvironment {
    var id: UUID = UUID()
    var applicant: Applicant
}

struct RegistrationContextKey: EnvironmentKey {
    static let defaultValue: Binding<RegistrationContext> = .constant(.init(applicant: .init()))
}

extension EnvironmentValues {
    var registrationContext: Binding<RegistrationContext> {
        get { self[RegistrationContextKey.self] }
        set { self[RegistrationContextKey.self] = newValue }
    }
}
