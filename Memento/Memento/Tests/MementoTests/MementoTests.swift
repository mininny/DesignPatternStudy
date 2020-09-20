import XCTest
@testable import Memento

final class MomentoTests: XCTestCase {
    func test_memento() {
        let eater = BurgerEater(money: 150)
        eater.buyBurger(.cheese)
        eater.buyBurger(.bigMac)
        eater.buyBurger(.bacon)
        
        eater.saveBurgers()
        
        while eater.eatBurger() {
            print("Remaining Burgers: \(eater.burgers.count)..")
        }
        print("No more Burgers!")
        
        eater.restoreBurgers()
        
        XCTAssertTrue(eater.eatBurger())
    }
}
