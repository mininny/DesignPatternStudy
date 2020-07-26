import XCTest
@testable import Abstract_Factory

final class Abstract_FactoryTests: XCTestCase {
    func test_burgerFactory() {
        let factory = BurgerFactory.createFactory()
        
        let topBun = factory.createBun(type: "Cheese Coated")
        
        let patty1 = factory.createPatty(type: "Beef")
        patty1.cookTo(.mediumRare)
        patty1.add(Cheese())
        let patty2 = factory.createPatty(type: "Beef")
        patty2.cookTo(.rare)
        
        let lettuce = factory.createVegetable("Lettuce")
        let tomato = factory.createVegetable("Tomato")
        
        let ketchup = factory.createSauce("Ketchup")
        let mayonaise = factory.createSauce("Mayonaise")
        
        let bottomBun = factory.createBun(type: "Plain")
        
        let hamburger = factory.createSandwich()
        hamburger.add(topBun)
        hamburger.add(patty1)
        hamburger.add(patty2)
        hamburger.add(lettuce)
        hamburger.add(tomato)
        hamburger.add(ketchup)
        hamburger.add(mayonaise)
        hamburger.add(bottomBun)
        
        let bigMac = hamburger.package()
        XCTAssertEqual(bigMac,"""
    < Cheese Coated Bun >
    < Beef >
    < Beef >
    < Lettuce >
    < Tomato >
    < Ketchup >
    < Mayonaise >
    < Plain Bun >
    """)
    }
    
    func test_subwayFactory() {
        let factory = SubwayFactory.createFactory()
        
        let bun = factory.createBun(type: "12inch Italian")
        
        let patty = factory.createPatty(type: "Turkey")
        patty.cookTo(.wellDone)
        patty.add(SubwayCheese(type: "Shredded"))
        
        let lettuce = factory.createVegetable("Lettuce")
        let tomato = factory.createVegetable("Tomato")
        
        let sauce = factory.createSauce("Mayonaise Ranch")
        
        let subway = factory.createSandwich()
        subway.add(bun)
        subway.add(patty)
        subway.add(lettuce)
        subway.add(tomato)
        subway.add(sauce)
        
        let turkeySandwich = subway.package()
        XCTAssertEqual(turkeySandwich,"""
    < 12inch Italian Bun >
    < Turkey >
    < Lettuce >
    < Tomato >
    < Mayonaise Ranch >
    """)
    }
}
