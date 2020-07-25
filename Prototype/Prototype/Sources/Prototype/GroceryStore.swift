//
//  GroceryStore.swift
//  
//
//  Created by Minhyuk Kim on 2020/07/25.
//

import Foundation

class GroceryStore {
    var items = [String: Prototype]()
    
    func register(_ name: Item, item: Prototype) {
        self.items[name.rawValue] = item
    }
    
    func manufacture(_ item: Item) -> Prototype? {
        return items[item.rawValue]
    }
}

