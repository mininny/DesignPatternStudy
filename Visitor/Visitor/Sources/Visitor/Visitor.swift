protocol Visitor {
    func visit(_ file: File)
    func visit(_ directory: Directory)
}

class ListVisitor: Visitor {
    var currentDirectory = ""
    func visit(_ file: File) {
        print("\(currentDirectory)/\(file.description)")
    }
    
    func visit(_ directory: Directory) {
        let savedDirectory = currentDirectory
        
        currentDirectory += "/\(directory.description)"
        print(currentDirectory)
        for entry in directory.getFiles() {
            entry.accept(self)
        }
        currentDirectory = savedDirectory
    }
}

class FileFindVisitor: Visitor {
    var currentDirectory = ""
    var `extension`: String
    init(ext: String) {
        self.extension = ext
    }
    
    func visit(_ file: File) {
        if let ext = file.description.split(separator: ".").last, String(ext) == self.extension {
            print("\(currentDirectory)/\(file.description)")
        }
    }
    
    func visit(_ directory: Directory) {
        let savedDirectory = currentDirectory
        
        currentDirectory += "/\(directory.description)"

        for entry in directory.getFiles() {
            entry.accept(self)
        }
        currentDirectory = savedDirectory
    }
}
