class BasicAggregate<T> {
    var iterator: BasicIterator<T> { BasicIterator(items) }
    
    private var items: [T]
    
    var length: Int { items.count }
    init(items: [T]) {
        self.items = items
    }
    
    func getItemAt(_ index: Int) -> T? {
        if index < 0 || index >= self.items.count { return nil }
        
        return self.items[index]
    }
    
    func appendItem(_ item: T) {
        self.items.append(item)
    }
}
