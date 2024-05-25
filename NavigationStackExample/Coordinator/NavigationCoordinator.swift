//
//  Router.swift
//  NavigationStackExample
//
//  Created by Safwen DEBBICHI on 20/05/2024.
//

import SwiftUI

struct Router: DynamicEnvironment {
    var id: UUID = UUID()
    var path: NavigationPath {
        didSet {
            print("NavigationStack Count: \(path.count)")
        }
    }
}

struct RouterKey: EnvironmentKey {
    static let defaultValue: Binding<Router> = .constant(.init(path: NavigationPath()))
}

extension EnvironmentValues {
    var router: Binding<Router> {
        get { self[RouterKey.self] }
        set { self[RouterKey.self] = newValue }
    }
}
