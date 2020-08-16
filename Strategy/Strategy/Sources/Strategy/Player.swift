//
//  Player.swift
//  
//
//  Created by Minhyuk Kim on 2020/08/16.
//

import Foundation

class Player {
    var strategy: Strategy
    
    init(with strategy: Strategy) {
        self.strategy = strategy
    }
    
    func playNext() -> RPS {
        return self.strategy.playNext()
    }
    
    func saveResult(win: Bool) {
        self.strategy.saveResult(win: win)
    }
}
