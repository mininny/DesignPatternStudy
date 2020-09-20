import Foundation

protocol Command {
    func execute()
}

class BuyStockCommand: Command {
    let customer: Customer
    let stock: Stock
    
    init(customer: Customer, stock: Stock) {
        self.customer = customer
        self.stock = stock
    }
    
    func execute() {
        customer.buyStock(stock)
    }
}

class SellStockCommand: Command {
    let customer: Customer
    let stock: String
    let count: Int
    
    init(customer: Customer, stock: String, count: Int) {
        self.customer = customer
        self.stock = stock
        self.count = count
    }
    
    func execute() {
        customer.sellStock(stock, count: count)
    }
}

class SplitStockCommand: Command {
    let customers: [Customer]
    let stock: Stock
    let ratio: Int
    
    init(customers: [Customer], stock: Stock, ratio: Int) {
        self.customers = customers
        self.stock = stock
        self.ratio = ratio
    }
    
    func execute() {
        let newPrice = stock.price / ratio
        for customer in customers {
            let stocks = customer.stocks.filter({ $0.name == stock.name })
            for stock in stocks {
                stock.price = newPrice
                stock.count *= ratio
            }
        }
    }
}

class Broker {
    var pendingCommands: [Command] = []
    
    var timer: Timer?
    
    func startMarket() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.process()
        }
    }
    
    func stopMarket() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func process() {
        self.pendingCommands.forEach({ $0.execute() })
        self.pendingCommands.removeAll()
    }
    
    func execute(command: Command) {
        self.pendingCommands.append(command)
    }
}

class Customer {
    var name: String
    var balance: Int
    var stocks: [Stock]
    
    init(name: String, balance: Int) {
        self.name = name
        self.balance = balance
        self.stocks = []
    }
    
    func buyStock(_ stock: Stock) {
        guard balance >= stock.price else { return }
        self.stocks.append(stock)
        balance -= stock.price
    }
    
    func sellStock(_ stockName: String, count: Int) {
        guard let stock = self.stocks.first(where: { $0.name == stockName }) else { return }
        guard stock.count >= count else { return }
        
        stock.count -= count
        self.balance += (stock.price * count)
    }
}

class Stock {
    let name: String
    var count: Int
    var price: Int
    let identifier = UUID().uuidString
    
    init(name: String, count: Int, price: Int) {
        self.name = name
        self.count = count
        self.price = price
    }
}
