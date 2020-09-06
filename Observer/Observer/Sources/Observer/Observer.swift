protocol Observer {
    var identifier: String { get }
    func willAlertCustomer(_ customer: String, item: Int)
}

class BurgerDisplay: Observer {
    var identifier: String
    
    var completedMenus: [(customer: String, item: Int)] = []
    
    init(identifier: String) {
        self.identifier = identifier
    }
    
    func willAlertCustomer(_ customer: String, item: Int) {
        print("\(customer), item number \(item) is ready for pickup.")
        self.completedMenus.append((customer, item))
    }
    
    func pickup(item: Int) {
        self.completedMenus.removeAll(where: { $0.item == item })
    }
}
