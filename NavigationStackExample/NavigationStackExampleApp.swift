//
//  NavigationStackExampleApp.swift
//  NavigationStackExample
//
//  Created by Safwen DEBBICHI on 20/05/2024.
//

import SwiftUI

@main
struct NavigationStackExampleApp: App {
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .modifier(DynamicEnvironmentModifier(keyPath: \.router, proxy: Router(path: NavigationPath())))
        }
    }
}
