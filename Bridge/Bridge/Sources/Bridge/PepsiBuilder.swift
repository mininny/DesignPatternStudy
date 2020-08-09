//
//  File.swift
//  
//
//  Created by Minhyuk Kim on 2020/08/10.
//

import Foundation

class PepsiBuilder: DrinkBuilder {
    var drink: String = ""
    
    func makeContainer() {
        drink += "<Pepsi>\n"
    }
    
    func pourDrink() {
        drink += "|Ewww|\n"
    }
    
    func package() -> String {
        defer {
            drink = ""
        }
        
        drink += "<<__>>\n"
        return drink
    }
}
