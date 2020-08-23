import XCTest
@testable import Composite

final class CompositeTests: XCTestCase {
    func testComposite() {
        let rootDir = Directory(name: "root")
        rootDir.add(entry: File(name: "info.plist", size: 12))
        let userDir = Directory(name: "usr")
        let mininnyDir = Directory(name: "mininny")
        mininnyDir.add(entry: File(name: "BigMac.png", size: 256))
        mininnyDir.add(entry: File(name: "iPhone.img", size: 1024))
        mininnyDir.add(entry: File(name: "Coke.gif", size: 2048))
        
        rootDir.add(entry: userDir)
        userDir.add(entry: mininnyDir)
        
        XCTAssertEqual(mininnyDir.size, (256 + 1024 + 2048))
        rootDir.printList()
    }
}
