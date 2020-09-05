import UIKit

protocol Mediator {
    func colleagueChanged()
}

class LoginView: UIView, Mediator {
    var guestSwitch: ColleagueUISwitch
    var userIdTextField: ColleagueUITextField
    var passwordTextField: ColleagueUITextField
    var loginButton: ColleagueUIButton
    var cancelButton: ColleagueUIButton
    
    override init(frame: CGRect) {
        self.guestSwitch = ColleagueUISwitch()
        self.userIdTextField = ColleagueUITextField()
        self.passwordTextField = ColleagueUITextField()
        self.loginButton = ColleagueUIButton()
        self.cancelButton = ColleagueUIButton()

        super.init(frame: frame)        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func colleagueChanged() {
        // Implement view changes
    }
}
