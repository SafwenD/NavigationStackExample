//
//  WelcomePath.swift
//  NavigationStackExample
//
//  Created by Safwen DEBBICHI on 21/05/2024.
//

import Foundation

protocol PathComponent: Codable, Hashable  {
    var id: String { get }
}

enum WelcomePath: PathComponent {
    var id: String {
        switch self {
        case .login: "login"
        case .registration: "registration"
        }
    }
    
    case login, registration
}
