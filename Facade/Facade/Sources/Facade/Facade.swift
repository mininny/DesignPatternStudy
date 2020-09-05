class McDonalds {
    static func buildCheeseBurger() -> String {
        let bun = BunBuilder(name: "Seasame Bun")
        bun.bake()
        bun.cut()
        
        let patty = PattyBuilder(name: "Beef Patty")
        patty.grill()
        patty.addCheese()
        
        let veggies = VeggieBuilder(veggies: ["Lettuce", "Tomato", "Pickle"])
        
        let package = BurgerPackager(name: "Wrap Box")
        return package.wrap(contents: [patty.name, veggies.veggies], buns: bun.contents).joined(separator: "\n")
    }
}

class BunBuilder {
    var name: String
    var contents: [String] = []
        
    init(name: String) {
        self.name = name
    }
    
    func bake() {
        self.contents = ["Baked \(name)"]
    }
    
    func cut() {
        self.contents.append(contentsOf: self.contents)
    }
}

class PattyBuilder {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func grill() {
        self.name = "Grilled \(name)"
    }
    
    func addCheese() {
        self.name = "\(name) with Cheese"
    }
}

class VeggieBuilder {
    var veggies: String
    
    init(veggies: [String]) {
        self.veggies = veggies.joined(separator: "\n")
    }
}

class BurgerPackager {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func wrap(contents: [String], buns: [String]) -> [String] {
        var package = [name]
        package.append(buns[0])
        package.append(contentsOf: contents)
        package.append(buns[1])
        package.append(name)
        
        return package
    }
}
