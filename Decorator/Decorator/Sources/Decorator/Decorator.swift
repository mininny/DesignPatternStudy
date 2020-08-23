protocol Display {
    var columns: Int { get }
    var rows: Int { get }
    
    func text(for row: Int) -> String
}

extension Display {
    func show() {
        (0..<self.rows).forEach { print(text(for: $0)) }
    }
}
