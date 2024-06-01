//
//  MainPath.swift
//  NavigationStackExample
//
//  Created by Safwen DEBBICHI on 21/05/2024.
//

import Foundation

enum MainPath: PathComponent {
    var id: String {
        switch self {
        case .home: "home"
        }
    }
    
    case home
}
