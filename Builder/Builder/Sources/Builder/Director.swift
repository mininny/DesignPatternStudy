//
//  Director.swift
//  
//
//  Created by Minhyuk Kim on 2020/07/25.
//

import Foundation

class SandwichDirector {
    let builder: Builder
    
    init(builder: Builder) {
        self.builder = builder
    }
    
    func construct() {
        builder.makeTopBun()
        builder.makePatty()
        builder.makeLettuce()
        builder.makeSauce()
        builder.makeBottomBun()
    }
}
