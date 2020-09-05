import XCTest
@testable import Facade

final class FacadeTests: XCTestCase {
    func test_McDonaldsFacade() {
        let cheeseBurger = McDonalds.buildCheeseBurger()
        XCTAssertEqual(cheeseBurger, """
        Wrap Box
        Baked Seasame Bun
        Grilled Beef Patty with Cheese
        Lettuce
        Tomato
        Pickle
        Baked Seasame Bun
        Wrap Box
        """)
    }
    
}
