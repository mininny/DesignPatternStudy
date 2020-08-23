//
//  File.swift
//  
//
//  Created by Minhyuk Kim on 2020/08/23.
//

import Foundation

class File: Entry {
    var name: String
    var size: UInt
    
    init(name: String, size: UInt) {
        self.name = name
        self.size = size
    }
    
    func printList(prefix: String) {
        print("\(prefix)/\(self)")
    }
    
    var description: String { self.name }
}
