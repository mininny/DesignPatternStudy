import XCTest
@testable import Prototype

final class PrototypeTests: XCTestCase {
    func func_prototype() {
        let store = GroceryStore()
        
        store.register(.driver, item: Utilities(name: "Driver", description: "Do what driver does"))
        store.register(.hammer, item: Utilities(name: "Hammer", description: "Do what hammer does"))
        store.register(.salmon, item: Food(name: "Salmon", expirationDate: Date().addingTimeInterval(36400)))
        store.register(.steak, item: Food(name: "Steak", expirationDate: Date().addingTimeInterval(1000)))
        
        let driver = store.manufacture(.driver)
        let copiedDriver = driver?.copy(with: nil)
        
        XCTAssert((driver as? Utilities) == (copiedDriver as? Utilities))
        
        let hammer = store.manufacture(.hammer)
        let copiedHammer = hammer?.copy(with: nil)
        
        XCTAssert((hammer as? Utilities) == (copiedHammer as? Utilities))
        
        let salmon = store.manufacture(.salmon)
        let copiedSalmon = salmon?.copy(with: nil)
        
        XCTAssert((salmon as? Food) == (copiedSalmon as? Food))
        
        let steak = store.manufacture(.steak)
        let copiedSteak = steak?.copy(with: nil)
        
        XCTAssert((steak as? Food) == (copiedSteak as? Food))
    }
}
