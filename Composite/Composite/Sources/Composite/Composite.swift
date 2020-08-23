protocol Entry: CustomStringConvertible {
    var name: String { get }
    var size: UInt { get }
    
    func add(entry: Entry)
    func printList(prefix: String)
}

extension Entry {
    func printList() {
        self.printList(prefix: "")
    }
    
    func add(entry: Entry) {
        assertionFailure("You cannot perform add unless it is specified")
    }
}
