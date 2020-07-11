class CharDisplay: TemplateDisplay {
    let char: Character
    
    init(_ character: Character) {
        self.char = character
    }
    
    func open() {
        print("<<", terminator: "")
    }
    
    func printItem() {
        print(char, terminator: "")
    }
    
    func close() {
        print(">>")
    }
}


class StringDisplay: TemplateDisplay {
    let string: String
    let width: Int
    
    init(_ string: String) {
        self.string = string
        self.width = string.count
    }
    
    func open() {
        printLine()
    }
    
    func printItem() {
        print("|\(self.string)|")
    }
    
    func close() {
        printLine()
    }
    
    func printLine() {
        print("+", terminator: "")
        for _ in 0..<width {
            print("-", terminator: "")
        }
        print("+")
    }
}
