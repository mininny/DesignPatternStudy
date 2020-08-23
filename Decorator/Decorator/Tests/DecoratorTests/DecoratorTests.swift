import XCTest
@testable import Decorator

final class DecoratorTests: XCTestCase {
    func testDecorator() {
        let display =
            CornerBorder(display:
                FullBorder(display:
                    StringDisplay(text: "Hello\nWorld")
                    , borderChar: "*")
                , borderChar: "+")
        display.show()

        XCTAssertEqual(display.columns, 5 + 2 + 2)
        XCTAssertEqual(display.rows, 2 + 2 + 2)
    }
}
