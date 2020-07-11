import XCTest
@testable import AdapterExample

final class AdapterTests: XCTestCase {
    func test_adapter() {
        let mathAdapter = MainAdapter<Int>()
        XCTAssertEqual(mathAdapter.add(1, 2), 3)
        
        let stringAdapter = MainAdapter<String>()
        XCTAssertEqual(stringAdapter.add("1", "2"), "12")
        
        let boolAdapter = MainAdapter<Bool>()
        XCTAssertEqual(boolAdapter.add(true, false), false)
    }
}
