import Foundation

protocol Node: CustomStringConvertible {
    init(context: Context) throws
}

class ProgramNode: Node {
    var commandListNode: Node
    
    required init(context: Context) throws {
        try context.skipToken("program")
        commandListNode = try CommandListNode(context: context)
    }
    
    var description: String { "[program \(commandListNode)]" }
}

class CommandListNode: Node {
    var list: [Node] = []
    
    required init(context: Context) throws {
        while true {
            if context.currentToken == nil {
                throw ParseError.missingEnd
            } else if context.currentToken == "end" {
                try context.skipToken("end")
                break
            } else {
                let commandNode = try CommandNode(context: context)
                self.list.append(commandNode)
            }
        }
    }
    
    var description: String { "[\(list.map({ $0.description }).joined(separator: ", "))]" }
}

class CommandNode: Node {
    var node: Node
    
    required init(context: Context) throws {
        if context.currentToken == "repeat" {
            node = try RepeatCommandNode(context: context)
        } else {
            node = try PrimitiveCommandNode(context: context)
        }
    }
    
    var description: String { node.description }
}

class RepeatCommandNode: Node {
    var number: Int
    var commandListNode: Node
    
    required init(context: Context) throws {
        try context.skipToken("repeat")
        number = try context.currentNumber()
        context.nextToken()
        commandListNode = try CommandListNode(context: context)
    }
    
    var description: String { "[repeat \(number) \(commandListNode)]"}
}

class PrimitiveCommandNode: Node {
    var name: String
    
    required init(context: Context) throws {
        self.name = context.currentToken ?? ""
        try context.skipToken(name)
        
        if name != "go" && name != "right" && name != "left" {
            throw ParseError.undefinedIdentifier
        }
    }
    
    var description: String { name }
}

class Context {
    var tokens: [String]
    var currentToken: String?
    
    init(text: String) {
        tokens = text.components(separatedBy: .whitespacesAndNewlines)
        self.nextToken()
    }
    
    @discardableResult
    func nextToken() -> String? {
        if let token = self.tokens.first {
            self.tokens.removeFirst()
            self.currentToken = token
        } else {
            self.currentToken = nil
        }
    
        return currentToken
    }
    
    func skipToken(_ token: String) throws {
        if token != currentToken {
            throw ParseError.unexpectedToken
        }
        
        nextToken()
    }
    
    func currentNumber() throws -> Int {
        if let token = self.currentToken, let number = Int(token) {
            return number
        }
        
        throw ParseError.invalidNumberFormat
    }
}

enum ParseError: Error {
    case unexpectedToken
    case invalidNumberFormat
    case missingEnd
    case undefinedIdentifier
}
