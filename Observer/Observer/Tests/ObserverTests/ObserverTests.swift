import XCTest
@testable import Observer

final class ObserverTests: XCTestCase {
    func test_burgerObserver() {
        let expectation = XCTestExpectation()

        let builder = BurgerBuilder()
        let display = BurgerDisplay(identifier: "Main")
        builder.addObserver(display)
        
        let cheeeseburger = builder.order(customer: "Mininny", name: "CheeseBurger")
        let bltSandwich = builder.order(customer: "Mininny", name: "BLT Sandwich")
        let fries = builder.order(customer: "Fat Mininny", name: "Fries")
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 3.0) {
            XCTAssertEqual(display.completedMenus.count, 3)
            XCTAssertEqual(display.completedMenus[0].item, cheeeseburger)
            XCTAssertEqual(display.completedMenus[1].item, bltSandwich)
            XCTAssertEqual(display.completedMenus[2].item, fries)
            
            display.pickup(item: cheeeseburger)
            display.pickup(item: bltSandwich)
            display.pickup(item: fries)
            
            XCTAssert(display.completedMenus.isEmpty)
            
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
}
