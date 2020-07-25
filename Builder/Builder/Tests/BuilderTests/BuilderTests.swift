import XCTest
@testable import Builder

final class BuilderTests: XCTestCase {
    func test_sandwichBuilder() {
        let hamburger = HamburgerBuilder()
        let hamburgerDirector = SandwichDirector(builder: hamburger)
        
        hamburgerDirector.construct()
        let hamburgerOutput = hamburger.package()
        XCTAssertEqual(hamburgerOutput,"""
        Seasame Covered Bun
        Two all-beef patties
        Lettuce
        Special sauce
        Plain Bun
        """)
        
        let subway = SubwayBuilder()
        let subwayDirector = SandwichDirector(builder: subway)
        
        subwayDirector.construct()
        let subwayOutput = subway.package()
        XCTAssertEqual(subwayOutput,"""
        Cheese Sprinkled Sandwich
        Three Meatballs
        Chopped lettuce
        Honey Mustard & Ranch
        Bottom sandwich
        """)
    }
}
