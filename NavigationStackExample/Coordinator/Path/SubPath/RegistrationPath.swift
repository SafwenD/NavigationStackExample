//
//  RegistrationPath.swift
//  NavigationStackExample
//
//  Created by Safwen DEBBICHI on 21/05/2024.
//

import Foundation

struct RegistrationSubPath: PathComponent {
    var id: String { step.id }
    var step: RegisterStep
}

extension RegistrationSubPath: Equatable {
    static func == (lhs: RegistrationSubPath, rhs: RegistrationSubPath) -> Bool {
        lhs.step == rhs.step
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(step.hashValue)
    }
}
