//
//  CokeBuilder.swift
//
//
//  Created by Minhyuk Kim on 2020/08/10.
//

class CokeBuilder: DrinkBuilder {
    var drink: String = ""
    
    func makeContainer() {
        drink += "<Coke>\n"
    }
    
    func pourDrink() {
        drink += "|Coke|\n"
    }
    
    func package() -> String {
        defer {
            drink = ""
        }
        
        drink += "<<__>>\n"
        return drink
    }
}
