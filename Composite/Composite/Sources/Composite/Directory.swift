//
//  Directory.swift
//  
//
//  Created by Minhyuk Kim on 2020/08/23.
//

import Foundation

class Directory: Entry {
    var name: String

    var entries: [Entry] = []
    var size: UInt { entries.map { $0.size }.reduce(0, +) }
    
    init(name: String) {
        self.name = name
    }
    
    func printList(prefix: String) {
        print("\(prefix)/\(self)")
        entries.forEach { $0.printList(prefix: "\(prefix)/\(self)") }
    }
    
    func add(entry: Entry) {
        self.entries.append(entry)
    }
    
    var description: String { self.name }
}
