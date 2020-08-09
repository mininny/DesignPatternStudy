//
//  DrinkBuilder.swift
//  
//
//  Created by Minhyuk Kim on 2020/08/10.
//

protocol DrinkBuilder {
    var drink: String { get }
    func makeContainer()
    func pourDrink()
    func package() -> String
}
