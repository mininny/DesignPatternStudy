protocol TemplateDisplay {
    func open()
    func printItem()
    func close()
}

extension TemplateDisplay {
    func display() {
        open()
        for _ in 0..<5 {
            printItem()
        }
        close()
    }
}
