import XCTest
@testable import COR

final class CORTests: XCTestCase {
    func test_COR() {
        let view = EmptyView(name: "view", dimensions: CGRect(x: 0, y: 0, width: 100, height: 100))
        let subview1 = EmptyView(name: "subview1", dimensions: CGRect(x: 0, y: 0, width: 50, height: 100))
        let subview2 = EmptyView(name: "subview2", dimensions: CGRect(x: 50, y: 0, width: 50, height: 100))
        view.add(subview1)
        view.add(subview2)
        subview1.add(Button(name: "button", dimensions: CGRect(x: 0, y: 0, width: 10, height: 10)))
        subview2.add(Slider(name: "slider", dimensions: CGRect(x: 50, y: 50, width: 10, height: 30)))
        subview2.add(Toggle(name: "toggle", dimensions: CGRect(x: 0, y: 0, width: 20, height: 20)))
        subview2.isEnabled = false
        
        view.touch(CGPoint(x: 5, y: 5))
    }
}
