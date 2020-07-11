class BasicIterator<T>: Iterator {
    let items: [T]
    internal var index = 0
    
    init(_ items: [T]) {
        self.items = items
    }
    
    var hasNext: Bool {
        return index <= items.count - 1
    }
    
    var hasPrevious: Bool {
        return index > 0
    }
    
    func next() -> T {
        let item = items[index]
        index += 1
        return item
    }
    
    func previous() -> T {
        index -= 1
        let item = items[index]
        return item
    }
}
