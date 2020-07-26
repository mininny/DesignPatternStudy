//
//  File.swift
//  
//
//  Created by Minhyuk Kim on 2020/07/26.
//

import Foundation

class SubwayFactory: Factory {
    func createBun(type: String) -> Bun {
        let components = type.split(separator: " ").map { String($0) }
        return SubwayBun(type: components.last!, length: components.first!)
    }

    func createPatty(type: String) -> Patty {
        return SubwayPatty(name: type)
    }

    func createVegetable(_ name: String) -> Component {
        return Vegetable(name)
    }

    func createSauce(_ name: String) -> Component {
        let components = name.split(separator: " ").map { String($0) }
        return SubwaySauce(components.first!, components.last!)
    }

    func createSandwich() -> Sandwich {
        return Subway()
    }
    
    static func createFactory() -> Factory {
        return SubwayFactory()
    }
}
