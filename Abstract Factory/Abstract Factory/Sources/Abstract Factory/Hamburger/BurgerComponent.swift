//
//  BurgerComponent.swift
//  
//
//  Created by Minhyuk Kim on 2020/07/26.
//

import Foundation

class BurgerBun: Bun {
    var type: String
    var name: String { "\(self.type) Bun" }
    
    var description: String { self.name }
    
    init(type: String) {
        self.type = type
    }
}

class BurgerPatty: Patty {
    var cookedDegree: String = ""
    var name: String
    
    var description: String { "\(self.cookedDegree) \(name)" }

    init(name: String) {
        self.name = name
    }
    
    func cookTo(_ cookedDegree: CookedDegree) {
        self.cookedDegree = cookedDegree.rawValue
    }
}

class Vegetable: Component {
    var name: String
    var description: String { self.name }
    
    init(_ name: String) {
        self.name = name
    }
}

class Sauce: Component {
    var name: String
    var description: String { self.name }
    init(_ name: String) {
        self.name = name
    }
}

class Cheese: Component {
    var name: String = "Cheese"
    
    var description: String { self.name }
}

class Burger: Sandwich {
    var components: [Component] = []
}
