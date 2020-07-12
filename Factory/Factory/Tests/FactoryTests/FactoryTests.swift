import XCTest
@testable import Factory

final class FactoryTests: XCTestCase {
    func test_factory() {
        var factory: Factory = MacBookFactory()
        
        let macBook = factory.create()
        XCTAssertTrue(macBook is MacBook)
        XCTAssertEqual(macBook.price, 3499)
        
        factory = IPhoneFactory()
        let iPhone = factory.create()
        XCTAssertTrue(iPhone is IPhone)
        XCTAssertEqual(iPhone.price, 999)
    }
}
