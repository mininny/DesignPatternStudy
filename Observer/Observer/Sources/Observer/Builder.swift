import Foundation

class BurgerBuilder {
    private var observers: [Observer] = []
    
    var index = 0
    
    func order(customer: String, name: String) -> Int {
        defer { self.index += 1 }
        let itemNumber = self.index
        print("Received order \(name) from \(customer): \(itemNumber)")
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) { 
            self.observers.forEach( { $0.willAlertCustomer(customer, item: itemNumber) })
        }
        
        return itemNumber
    }
    
    func addObserver(_ observer: Observer) {
        self.observers.append(observer)
    }
    
    func removeObserver(_ observer: Observer) {
        self.observers.removeAll(where: { $0.identifier == observer.identifier })
    }
}
