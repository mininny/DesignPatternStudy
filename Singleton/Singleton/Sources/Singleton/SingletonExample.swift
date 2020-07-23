//
//  SingletonExample.swift
//  
//
//  Created by Minhyuk Kim on 2020/07/24.
//

import Foundation

class Counter {
    static let main = Counter()
    
    var count = 0
    private init() { }
    
    func addCount() {
        self.count += 1
    }
}
