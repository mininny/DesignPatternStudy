import XCTest
@testable import Template

final class TemplateTests: XCTestCase {
    func test_templateDisplays() {
        let charDisplay = CharDisplay("A")
        let stringDisplay = StringDisplay("Swift")
        
        charDisplay.display()
        stringDisplay.display()
    }
}
