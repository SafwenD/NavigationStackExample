//
//  ViewContext.swift
//  NavigationStackExample
//
//  Created by Safwen DEBBICHI on 20/05/2024.
//

import SwiftUI

typealias DynamicEnvironmentKeyPath<Env: DynamicEnvironment> = WritableKeyPath<EnvironmentValues, Binding<Env>>

protocol DynamicEnvironment {
    var id: UUID { get }
}

struct DynamicEnvironmentModifier<Env: DynamicEnvironment>: ViewModifier {
    var keyPath: DynamicEnvironmentKeyPath<Env>
    @State var proxy: Env
    
    func body(content: Content) -> some View {
        content
            .environment(keyPath, $proxy)
    }
}
