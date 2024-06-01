//
//  Router.swift
//  NavigationStackExample
//
//  Created by Safwen DEBBICHI on 20/05/2024.
//

import SwiftUI

struct Router: DynamicEnvironment {
    var id: UUID
    var path: NavigationPath
    
    init(id: UUID = UUID(), path: NavigationPath = NavigationPath()) {
        self.path = path
        self.id = id
    }
    
    init<Component: PathComponent>(id: UUID = UUID(), components: [Component] = []) {
        self.path = NavigationPath(components)
        self.id = id
    }
}

extension Router {
    // Removes the current NavigationPath and creates a new one with a list of Hashable Components
    mutating func setFullPath<Component: PathComponent>(components: [Component]) {
        path = NavigationPath(components)
    }
    // Pushes one or more component by appending the NavigationPath
    mutating func push<Component: PathComponent>(component: Component...) {
        for item in component {
            path.append(item)
        }
    }
    // Remove a count of components from the NavigationPath
    mutating func pop(count: Int = 1) {
        path.removeLast(count)
    }
    // Reinitializes the NavigationPath
    mutating func popToRoot() {
        path = NavigationPath()
    }
}

extension Router {
    func save(forKey key: String) {
        guard let codable = path.codable else { return }
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(codable)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {}
    }
    
    func removeSave(forKey key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    mutating func load(forKey key: String) {
        guard let data = UserDefaults.standard.value(forKey: key) as? Data else {
            self.path = NavigationPath()
            return 
        }
        do {
            let representation = try JSONDecoder().decode(
                NavigationPath.CodableRepresentation.self,
                from: data)
            self.path = NavigationPath(representation)
        } catch {
            self.path = NavigationPath()
        }
    }
}

struct RouterKey: EnvironmentKey {
    static let defaultValue: Binding<Router> = .constant(.init())
}

extension EnvironmentValues {
    var router: Binding<Router> {
        get { self[RouterKey.self] }
        set { self[RouterKey.self] = newValue }
    }
}
