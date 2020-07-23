import XCTest
@testable import Singleton

final class SingletonTests: XCTestCase {
    func test_Singleton() {
        let singletonObject = SingletonObject.shared
        let singletonObject2 = SingletonObject.shared
        
        XCTAssertEqual(singletonObject, singletonObject2)
    }
    
    func test_SingletonExample() {
        let counter = Counter.main
        counter.addCount()
        XCTAssertEqual(counter.count, 1)
        
        let anotherCounter = Counter.main
        anotherCounter.addCount()
        XCTAssertEqual(counter.count, 2)
        XCTAssertEqual(anotherCounter.count, 2)
    }
}
