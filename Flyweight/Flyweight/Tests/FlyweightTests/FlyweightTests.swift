import XCTest
@testable import Flyweight

final class FlyweightTests: XCTestCase {
    func test_flyweight() {
        let renderer = MapRenderer()
        renderer.render(count: 5)
        
        XCTAssertEqual(renderer.renderItems.count, 20)
        XCTAssertEqual(Factory.shared.renderItems.count, 4)
    }
}
