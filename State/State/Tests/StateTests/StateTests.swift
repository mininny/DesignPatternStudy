import XCTest
@testable import State

final class StateTests: XCTestCase {
    func test_state() {
        let exp = XCTestExpectation()
        
        let button = ButtonContext()
        button.tap()
        XCTAssert(button.actions.removeFirst() == .tap)
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            button.release()
            XCTAssert(button.actions.removeFirst() == .longPress)
            
            button.tap()
            button.release()
            XCTAssert(button.actions.removeFirst() == .doubleTap)
            
            DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
                button.tap()
                XCTAssert(button.actions.removeFirst() == .tap)
                button.release()
                
                button.tap()
                XCTAssert(button.actions.removeFirst() == .doubleTap)
                button.release()

                exp.fulfill()
            }
        }
        
        self.wait(for: [exp], timeout: 10)
    }
}
