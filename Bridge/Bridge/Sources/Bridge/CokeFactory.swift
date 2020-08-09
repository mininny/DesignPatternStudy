//
//  CokeFactory.swift
//  
//
//  Created by Minhyuk Kim on 2020/08/10.
//

class CokeFactory: DrinkFactory {
    override func createDrink() -> String {
        let drink = super.createDrink()
        
        if drink.contains("Pepsi") { return "TREASON!" }
        
        return drink
    }
}
