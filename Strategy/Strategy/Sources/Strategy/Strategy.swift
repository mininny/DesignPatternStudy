protocol Strategy {
    func playNext() -> RPS
    func saveResult(win: Bool)
}

class WinningStrategy: Strategy {
    var won = false
    var previousHand: RPS?
    
    func playNext() -> RPS {
        if won, let previousHand = self.previousHand {
            return previousHand
        }
        
        return RPS.random
    }
    
    func saveResult(win: Bool) {
        self.won = win
    }
}

class RandomStrategy: Strategy {
    func playNext() -> RPS {
        return .random
    }
    
    func saveResult(win: Bool) { }
}
