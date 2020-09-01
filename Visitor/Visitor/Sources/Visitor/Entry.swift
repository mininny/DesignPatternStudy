//
//  Entry.swift
//  
//
//  Created by Minhyuk Kim on 2020/09/01.
//

import Foundation

protocol Element {
    func accept(_ visitor: Visitor)
}

protocol Entry: CustomStringConvertible, Element {
    var name: String { get }
}

extension Entry {
    func add(_ entry: Entry) {
        assertionFailure("You must only call \(#function) on a directory")
    }
    
    func getFiles() -> [Entry] {
        assertionFailure("You must only call \(#function) on a directory")
        return []
    }
}

class File: Entry {
    var name: String
    
    var description: String { name }
    
    func accept(_ visitor: Visitor) {
        visitor.visit(self)
    }
    
    init(name: String) {
        self.name = name
    }
}

class Directory: Entry {
    var name: String
    var description: String { name }
    
    var entries: [Entry] = []
    
    init(name: String) {
        self.name = name
    }
    
    func accept(_ visitor: Visitor) {
        visitor.visit(self)
    }
    
    func add(_ entry: Entry) {
        self.entries.append(entry)
    }
    
    func getFiles() -> [Entry] {
        return entries
    }
}
