protocol Iterator {
    associatedtype ItemType
    var hasNext: Bool { get }
    var hasPrevious: Bool { get }
    
    func next() -> ItemType
    func previous() -> ItemType
}
