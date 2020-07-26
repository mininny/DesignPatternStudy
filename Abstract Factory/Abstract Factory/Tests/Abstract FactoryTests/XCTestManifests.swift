import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Abstract_FactoryTests.allTests),
    ]
}
#endif
