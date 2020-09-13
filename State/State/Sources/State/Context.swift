import Foundation

protocol Context: class {
    func changeState(to state: State)
    
    func didTap()
    func didLongPress()
    func didDoubleTap()
    
    var isTapped: Bool { get set }
    var lastTap: TimeInterval { get set }
}

class ButtonContext: Context {
    enum ButtonAction {
        case tap, doubleTap, longPress
    }
    
    private lazy var state: State = { IdleState(with: self) }()
    
    var isTapped: Bool = false
    var lastTap: TimeInterval = 0
    
    var actions: [ButtonAction] = []
    
    internal func changeState(to state: State) {
        self.state = state
    }
    
    func tap() {
        state.didTap(self)
    }
    
    func release() {
        state.didRelease(self)
    }
    
    internal func didTap() {
        print("Tapped")
        self.actions.append(.tap)
    }
    internal func didLongPress() {
        print("Long Pressed")
        self.actions.append(.longPress)
    }
    
    internal func didDoubleTap() {
        print("Double Tapped")
        self.actions.append(.doubleTap)
    }
}

