//
//  Items.swift
//  
//
//  Created by Minhyuk Kim on 2020/07/25.
//

import Foundation

enum Item: String {
    case hammer
    case driver
    case salmon
    case steak
}

class Utilities: Prototype, Equatable {
    let name: String
    let description: String
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Utilities(name: name, description: description)
    }
    
    static func == (lhs: Utilities, rhs: Utilities) -> Bool {
        return lhs.name == rhs.name && lhs.description == rhs.description
    }
}

class Food: Prototype, Equatable {
    let name: String
    let expirationDate: Date
    
    init(name: String, expirationDate: Date) {
        self.name = name
        self.expirationDate = expirationDate
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Food(name: name, expirationDate: expirationDate)
    }
    
    static func == (lhs: Food, rhs: Food) -> Bool {
        return lhs.name == rhs.name && lhs.expirationDate == rhs.expirationDate
    }
}
