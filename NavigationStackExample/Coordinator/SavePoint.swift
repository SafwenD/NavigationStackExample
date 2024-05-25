//
//  SavePoint.swift
//  NavigationStackExample
//
//  Created by Safwen DEBBICHI on 21/05/2024.
//

import SwiftUI

enum SavePoint: String {
    case registration
}

extension SavePoint {
    func save(path: NavigationPath) {
        guard let codable = path.codable else { return }
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(codable)
            UserDefaults.standard.setValue(data, forKey: self.rawValue)
        } catch {}
    }
    
    func removeSave() {
        UserDefaults.standard.removeObject(forKey: self.rawValue)
    }
    
    func load() -> NavigationPath? {
        guard let data = UserDefaults.standard.value(forKey: self.rawValue) as? Data else {
            return nil
        }
        do {
            let representation = try JSONDecoder().decode(
                NavigationPath.CodableRepresentation.self,
                from: data)
            return NavigationPath(representation)
        } catch {
            return nil
        }
    }
}

