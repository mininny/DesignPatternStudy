import XCTest
@testable import Visitor

final class VisitorTests: XCTestCase {
    func test_listVisitor() {
        let root = Directory(name: "root")
        let user = Directory(name: "user")
        let temp = Directory(name: "temp")
        
        root.add(user)
        root.add(temp)
        user.add(File(name: "mininny"))
        temp.add(File(name: "config"))
        
        let visitor = ListVisitor()
        root.accept(visitor)
    }
    
    func test_fileFindVisitor() {
        let root = Directory(name: "root")
        let user = Directory(name: "user")
        let temp = Directory(name: "temp")
        
        root.add(user)
        root.add(temp)
        user.add(File(name: "mininny"))
        user.add(File(name: "internal.yml"))
        temp.add(File(name: "config.yml"))
        
        let visitor = FileFindVisitor(ext: "yml")
        root.accept(visitor)
    }
}
