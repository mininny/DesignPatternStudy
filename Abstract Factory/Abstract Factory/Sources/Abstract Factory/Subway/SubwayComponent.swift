//
//  SubwayComponent.swift
//  
//
//  Created by Minhyuk Kim on 2020/07/26.
//

import Foundation

class SubwayBun: Bun {
    var type: String
    var name: String { "\(self.type) Bun" }
    
    var description: String { self.name }
    
    init(type: String, length: String) {
        self.type = "\(length) \(type)"
    }
}

class SubwayPatty: Patty {
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

class SubwaySauce: Component {
    var name: String
    var description: String { self.name }
    
    init(_ first: String, _ second: String) {
        self.name = "\(first) \(second)"
    }
}

class SubwayCheese: Component {
    var name: String
    var description: String { self.name }
    
    init(type: String) {
        self.name = type
    }
}

class Subway: Sandwich {
    var components: [Component] = []
}
