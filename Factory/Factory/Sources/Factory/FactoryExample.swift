class MacBookFactory: Factory {
    func create() -> Product {
        let macBook = MacBook()
        return macBook
    }
    
    func factoryMethod() {
        print("This is MacBook Factory")
    }
}

class MacBook: Product {
    var price: Int = 3499
    
    func productMethod() {
        print("This is MacBook that costs \(price) dollars")
    }
}

class IPhoneFactory: Factory {
    func create() -> Product {
        let iPhone = IPhone()
        return iPhone
    }
    
    func factoryMethod() {
        print("This is iPhone Factory")
    }
}

class IPhone: Product {
    var price: Int = 999
    
    func productMethod() {
        print("This is iPhone that costs \(price) dollars")
    }
}
