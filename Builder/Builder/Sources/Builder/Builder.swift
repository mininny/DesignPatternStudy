protocol Builder {
    func makeTopBun()
    func makePatty()
    func makeLettuce()
    func makeSauce()
    func makeBottomBun()
}

class HamburgerBuilder: Builder {
    var burgerOutput = ""
    
    func makeTopBun() {
        let topBun = "Seasame Covered Bun\n"
        self.burgerOutput += topBun
    }
    
    func makePatty() {
        let patty = "Two all-beef patties\n"
        self.burgerOutput += patty
    }
    
    func makeLettuce() {
        let lettuce = "Lettuce\n"
        self.burgerOutput += lettuce
    }
    
    func makeSauce() {
        let sauce = "Special sauce\n"
        self.burgerOutput += sauce
    }
    
    func makeBottomBun() {
        let bottomBun = "Plain Bun"
        self.burgerOutput += bottomBun
    }
    
    func package() -> String {
        return self.burgerOutput
    }
}

class SubwayBuilder: Builder {
    var subwayOutput = ""
    
    func makeTopBun() {
        let topBun = "Cheese Sprinkled Sandwich\n"
        self.subwayOutput += topBun
    }
    
    func makePatty() {
        let patty = "Three Meatballs\n"
        self.subwayOutput += patty
    }
    
    func makeLettuce() {
        let lettuce = "Chopped lettuce\n"
        self.subwayOutput += lettuce
    }
    
    func makeSauce() {
        let sauce = "Honey Mustard & Ranch\n"
        self.subwayOutput += sauce
    }
    
    func makeBottomBun() {
        let bottomBun = "Bottom sandwich"
        self.subwayOutput += bottomBun
    }
    
    func package() -> String {
        return self.subwayOutput
    }
}

