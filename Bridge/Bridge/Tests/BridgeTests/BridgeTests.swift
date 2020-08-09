import XCTest
@testable import Bridge

final class BridgeTests: XCTestCase {
    func test_cokeFactory() {
        let factory = CokeFactory(with: CokeBuilder())
        let drink = factory.createDrink()
        XCTAssertEqual(drink, """
        <Coke>
        |Coke|
        <<__>>
        
        """)
    }
    
    func test_cokeFactoryWithPepsi() {
        let factory = CokeFactory(with: PepsiBuilder())
        let drink = factory.createDrink()
        XCTAssertEqual(drink, "TREASON!")
    }
    
    func test_drinkFactoryWithPepsi() {
        let factory = DrinkFactory(with: PepsiBuilder())
        let drink = factory.createDrink()
        XCTAssertEqual(drink, """
        <Pepsi>
        |Ewww|
        <<__>>
        
        """)
    }
}
