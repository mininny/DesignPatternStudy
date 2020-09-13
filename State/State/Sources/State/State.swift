import Foundation

protocol State {
    func didTap(_ context: Context)
    func didRelease(_ context: Context)
}

class IdleState: State {
    init(with context: Context) {
        context.isTapped = false
    }
    
    func didTap(_ context: Context) {
        context.changeState(to: TappedState(with: context))
    }
    
    func didRelease(_ context: Context) {
        print("Releasing in IdleState is not allowed")
    }
}

class TappedState: State {
    init(with context: Context) {
        let currentTime = Date().timeIntervalSince1970
        if currentTime - context.lastTap < 1 {
            context.didDoubleTap()
        } else {
            context.didTap()
        }
        
        context.lastTap = currentTime
        context.isTapped = true
    }
    
    func didTap(_ context: Context) {
        print("Tapping in TappedState is not allowed")
    }
    
    func didRelease(_ context: Context) {
        let currentTime = Date().timeIntervalSince1970
        if currentTime - context.lastTap > 3 {
            context.didLongPress()
        } //else {
//            context.didTap()
//            context.lastTap = currentTime
//        }
        context.lastTap = currentTime
        context.changeState(to: IdleState(with: context))
    }
}
