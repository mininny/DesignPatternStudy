//
//  Factory.swift
//  
//
//  Created by Minhyuk Kim on 2020/07/26.
//

import Foundation

protocol Factory: class {
    func createBun(type: String) -> Bun
    func createPatty(type: String) -> Patty
    func createVegetable(_ name: String) -> Component
    func createSauce(_ name: String) -> Component
    func createSandwich() -> Sandwich
    static func createFactory() -> Factory
}
