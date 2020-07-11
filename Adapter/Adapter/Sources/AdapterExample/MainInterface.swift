protocol MainInterface {
    associatedtype ItemType
    func add(_ item1: ItemType, _ item2: ItemType) -> ItemType?
}
