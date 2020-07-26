//
//  BurgerFactory.swift
//  
//
//  Created by Minhyuk Kim on 2020/07/26.
//

import Foundation

class BurgerFactory: Factory {
    func createBun(type: String) -> Bun {
        return BurgerBun(type: type)
    }

    func createPatty(type: String) -> Patty {
        return BurgerPatty(name: type)
    }

    func createVegetable(_ name: String) -> Component {
        return Vegetable(name)
    }

    func createSauce(_ name: String) -> Component {
        return Sauce(name)
    }

    func createSandwich() -> Sandwich {
        return Burger()
    }
    
    static func createFactory() -> Factory {
        return BurgerFactory()
    }
}
