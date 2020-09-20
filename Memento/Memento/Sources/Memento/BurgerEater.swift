class BurgerEater {
    enum Burger {
        case cheese, chicken, bacon, blt, bigMac
    }
    
    private class BurgerMemento: Memento {
        var money: Int64
        var burgers: [Burger]
        
        init(money: Int64, burgers: [Burger]) {
            self.money = money
            self.burgers = burgers
        }
    }
    
    var money: Int64
    var burgers: [Burger] = []
    
    private var momento: BurgerMemento?
    
    init(money: Int64) {
        self.money = money
    }
    
    @discardableResult
    func buyBurger(_ burger: Burger) -> Bool {
        guard self.money >= 50 else {
            print("Not enough money to buy \(burger) burger ☹️")
            return false
        }
        
        self.burgers.append(burger)
        self.money -= 50
        
        print("Just bought \(burger) burger!")
        
        return true
    }
    
    func eatBurger() -> Bool {
        guard !self.burgers.isEmpty else { return false }
        
        let burger = self.burgers.removeFirst()
        print("Just ate \(burger) burger! Yum 😋")
        
        return true
    }
    
    func restoreBurgers() {
        guard let momento = self.momento else { return }
        
        print("Restoring burgers! 🧙‍♀️")
        
        self.money = momento.money
        self.burgers = momento.burgers
    }
    
    func saveBurgers() {
        let momento = BurgerMemento(money: self.money, burgers: self.burgers)
        
        print("Saving burgers! 🧙‍♀️")
        
        self.momento = momento
    }
}
