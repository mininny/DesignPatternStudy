import XCTest
@testable import Command

final class CommandTests: XCTestCase {
    func test_command() {
        let expectation = XCTestExpectation()
        
        let broker = Broker()
        let customer = Customer(name: "Mininny", balance: 2500)
        
        let AAPL = Stock(name: "Apple", count: 1, price: 500)
        let buyApple = BuyStockCommand(customer: customer, stock: AAPL)
        broker.execute(command: buyApple)
        
        let TSLA = Stock(name: "Tesla", count: 1, price: 2000)
        let buyTesla = BuyStockCommand(customer: customer, stock: TSLA)
        broker.execute(command: buyTesla)
        
        let splitAAPL = SplitStockCommand(customers: [customer], stock: AAPL, ratio: 4)
        broker.execute(command: splitAAPL)
        
        broker.startMarket()
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.25) {
            XCTAssert(customer.balance == 0)
            XCTAssert(customer.stocks.reduce(0, { $0 + $1.count }) == 5)
            
            let sellAAPL = SellStockCommand(customer: customer, stock: "Apple", count: 2)
            broker.execute(command: sellAAPL)
            XCTAssert(customer.stocks.reduce(0, { $0 + $1.count }) == 5) // Not processed yet
            
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.25) {
                XCTAssert(customer.stocks.reduce(0, { $0 + $1.count }) == 3)
                XCTAssert(customer.stocks.first(where: { $0.name == "Apple" })?.count == 2)
                
                expectation.fulfill()
            }
        }
        
        self.wait(for: [expectation], timeout: 5.0)
    }
}
