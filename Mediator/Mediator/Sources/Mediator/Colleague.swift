import UIKit

protocol Colleague: class {
    var mediator: Mediator? { get }
    func setColleague(enabled: Bool)
}

class ColleagueUISwitch: UISwitch, Colleague {
    var mediator: Mediator?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addTarget(self, action: #selector(switchChanged(sender:)), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setColleague(enabled: Bool) {
        self.isEnabled = enabled
    }
    
    @objc func switchChanged(sender: UISwitch) {
        self.mediator?.colleagueChanged()
    }
}

class ColleagueUITextField: UITextField, Colleague {
    var mediator: Mediator?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addTarget(self, action: #selector(textFieldChanged(sender:)), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setColleague(enabled: Bool) {
        self.isEnabled = enabled
    }
    
    @objc func textFieldChanged(sender: UITextField) {
        self.mediator?.colleagueChanged()
    }
}

class ColleagueUIButton: UIButton, Colleague {
    var mediator: Mediator?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addTarget(self, action: #selector(buttonChanged(sender:)), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setColleague(enabled: Bool) {
        self.isEnabled = enabled
    }
    
    @objc func buttonChanged(sender: UIButton) {
        self.mediator?.colleagueChanged()
    }
}

