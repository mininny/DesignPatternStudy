import Foundation

protocol View {
    var dimensions: CGRect { get }
    var name: String { get }
    var views: [View] { get set }
    @discardableResult func touch(_ point: CGPoint) -> Bool
    func add(_ subview: View)
}

class EmptyView: View {
    var views: [View] = []
    var dimensions: CGRect
    var name: String
    
    var isEnabled: Bool = true
    
    init(name: String, dimensions: CGRect) {
        self.name = name
        self.dimensions = dimensions
    }
    
    func touch(_ point: CGPoint) -> Bool {
        for view in self.views {
            if view.touch(point) == true {
                print("Touch activated within \(view)")
                return true
            }
        }
        
        print("Touch was not handled!")
        return false
    }
    
    func add(_ subview: View) {
        self.views.append(subview)
    }
}

class Button: View {
    var views: [View] = []
    var dimensions: CGRect
    var name: String
    
    init(name: String, dimensions: CGRect) {
        self.name = name
        self.dimensions = dimensions
    }
    
    func touch(_ point: CGPoint) -> Bool {
        return dimensions.contains(point)
    }
    
    func add(_ subview: View) { }
}

class Slider: View {
    var views: [View] = []
    var dimensions: CGRect
    var name: String
    
    init(name: String, dimensions: CGRect) {
        self.name = name
        self.dimensions = dimensions
    }
    
    func touch(_ point: CGPoint) -> Bool {
        return false
    }
    
    func add(_ subview: View) { }
}

class Toggle: View {
    var views: [View] = []
    var dimensions: CGRect
    var name: String
    
    init(name: String, dimensions: CGRect) {
        self.name = name
        self.dimensions = dimensions
    }
    
    func touch(_ point: CGPoint) -> Bool {
        return dimensions.contains(point)
    }
    
    func add(_ subview: View) { }
}

