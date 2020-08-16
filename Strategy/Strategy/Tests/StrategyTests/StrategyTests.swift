import XCTest
@testable import Strategy

final class StrategyTests: XCTestCase {
    func test_strategy() {
        let player1 = Player(with: RandomStrategy())
        let player2 = Player(with: WinningStrategy())
        
        var results: [Bool] = []
        
        for _ in 0..<100 {
            let choice1 = player1.playNext()
            let choice2 = player2.playNext()
            
            results.append(choice1.wins(choice2))
        }
        
        XCTAssert(results.filter { $0 }.count < 50 )
    }
}
