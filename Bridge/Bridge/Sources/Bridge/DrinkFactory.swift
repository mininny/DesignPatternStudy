//
//  DrinkFactory.swift
//  
//
//  Created by Minhyuk Kim on 2020/08/10.
//

import Foundation
class DrinkFactory {
    var builder: DrinkBuilder
    
    init(with builder: DrinkBuilder) {
        self.builder = builder
    }
    
    func createDrink() -> String {
        builder.makeContainer()
        builder.pourDrink()
        return builder.package()
    }
}
