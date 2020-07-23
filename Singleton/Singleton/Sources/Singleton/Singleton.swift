import Foundation

class SingletonObject: NSObject {
    static let shared = SingletonObject()
    
    private override init() { }
}
