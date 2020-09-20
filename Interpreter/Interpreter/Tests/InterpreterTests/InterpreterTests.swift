import XCTest
@testable import Interpreter

final class InterpreterTests: XCTestCase {
    func test_interpreter() throws {
        let text = """
        program end
        program go end
        program go right go right go right go right end
        program repeat 4 go right end end
        program repeat 4 repeat 3 go right go left end right end end
        """
        
        var output: [String] = []
        
        for line in text.components(separatedBy: .newlines) {
            let node = try ProgramNode(context: Context(text: line))
            output.append(node.description)
        }
        
        XCTAssertEqual(output.removeFirst(), """
        [program []]
        """)
        XCTAssertEqual(output.removeFirst(), """
        [program [go]]
        """)
        XCTAssertEqual(output.removeFirst(), """
        [program [go, right, go, right, go, right, go, right]]
        """)
        XCTAssertEqual(output.removeFirst(), """
        [program [[repeat 4 [go, right]]]]
        """)
        XCTAssertEqual(output.removeFirst(), """
        [program [[repeat 4 [[repeat 3 [go, right, go, left]], right]]]]
        """)
    }
}
