import XCTest
@testable import Iterator

final class IteratorTests: XCTestCase {
    func test_IteratorNext() {
        let item = [1,2,3]
        
        let iterator = BasicIterator(item)
        XCTAssertTrue(iterator.hasNext)
        XCTAssertEqual(iterator.next(), 1)
        XCTAssertTrue(iterator.hasNext)
        XCTAssertEqual(iterator.next(), 2)
        XCTAssertTrue(iterator.hasNext)
        XCTAssertEqual(iterator.next(), 3)
        
        XCTAssertFalse(iterator.hasNext)
    }
    
    func test_IteratorTypes() {
        let intItems = [1,2,3]
        let doubleItems = [1.0, 2.0, 3.0]
        let stringItems = ["1", "2", "3"]
        
        let intIterator = BasicIterator(intItems)
        let doubleIterator = BasicIterator(doubleItems)
        let stringIterator = BasicIterator(stringItems)
        
        XCTAssertEqual(intIterator.next(), 1)
        XCTAssertEqual(doubleIterator.next(), 1.0)
        XCTAssertEqual(stringIterator.next(), "1")
    }
    
    func test_IteratorPrevious() {
        let items = [1,2,3]
        let iterator = BasicIterator(items)
        
        iterator.index = items.count - 1
        XCTAssertTrue(iterator.hasPrevious)
        XCTAssertEqual(iterator.previous(), 2)
        XCTAssertTrue(iterator.hasPrevious)
        XCTAssertEqual(iterator.previous(), 1)
        
        XCTAssertFalse(iterator.hasPrevious)
    }
    
    func test_aggregate() {
        let items = [1,2,3]
        let aggregate = BasicAggregate(items: items)
        
        let iterator = aggregate.iterator
        XCTAssertEqual(iterator.next(), 1)
    }
    
    func test_aggregateWithChangingItems() {
        let items = [1,2,3]
        let aggregate = BasicAggregate(items: items)
        
        let iterator = aggregate.iterator
        XCTAssertEqual(iterator.next(), 1)
        
        aggregate.appendItem(4)
        let iterator2 = aggregate.iterator
        XCTAssertEqual(iterator2.next(), 1)
        XCTAssertEqual(iterator2.next(), 2)
        XCTAssertEqual(iterator2.next(), 3)
        XCTAssertEqual(iterator2.next(), 4)
    }
}
