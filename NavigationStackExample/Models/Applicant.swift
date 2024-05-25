//
//  Applicant.swift
//  NavigationStackExample
//
//  Created by Safwen DEBBICHI on 21/05/2024.
//

import Foundation

enum RegisterStep: Codable, Hashable {
    static var count: Int { 4 }
    
    case first, second, third(savePoint: Applicant? = nil), fourth
}

struct Applicant: Codable, Hashable {
    var firstname: String = ""
    var lastname: String = ""
    var age: String = ""
    var country: String = ""
    
    mutating func updating(firstname: String) -> Applicant {
        self.firstname = firstname
        return self
    }
    
    mutating func updating(lastname: String) -> Applicant {
        self.lastname = lastname
        return self
    }
    
    mutating func updating(age: String) -> Applicant {
        self.age = age
        return self
    }
    
    mutating func updating(country: String) -> Applicant {
        self.country = country
        return self
    }
    
    var description: String {
        "Fistname: \(firstname)\nLastname: \(lastname)\nAge: \(age)\nCountry: \(country)"
    }
}
