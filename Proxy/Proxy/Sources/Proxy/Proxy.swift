protocol UserSettable {
    var userId: String? { get }
    var password: String? { get }
    
    func enableNotifications()
    func disableNotifications()

    func signIn(userId: String, password: String)
    func signOut()
    func changePassword(current: String, new: String)
}

class UserSettingsProxy: UserSettable {
    
    internal var real: UserSettings?
    var userId: String? { self.real?.userId }
    var password: String? { self.real?.password }
    
    private func realize() {
        if self.real == nil {
            self.real = UserSettings()
        }
    }
    
    func enableNotifications() {
        NotificationsManager.shared.enableNotifications()
    }
    
    func disableNotifications() {
        NotificationsManager.shared.disableNotifications()
    }
    
    func signIn(userId: String, password: String) {
        self.realize()
        self.real?.signIn(userId: userId, password: password)
    }
    
    func signOut() {
        self.realize()
        self.real?.signOut()
        self.real = nil
    }
    
    func changePassword(current: String, new: String) {
        guard self.real != nil else { return }
        self.real?.changePassword(current: current, new: new)
    }
}

class UserSettings: UserSettable {
    
    var userId: String?
    var password: String?
    
    func enableNotifications() {
        NotificationsManager.shared.enableNotifications()
    }
    
    func disableNotifications() {
        NotificationsManager.shared.disableNotifications()
    }
    
    func signIn(userId: String, password: String) {
        self.userId = userId
        self.password = password
    }
    
    func signOut() {
        self.userId = nil
        self.password = nil
    }
    
    func changePassword(current: String, new: String) {
        guard self.userId != nil else { return }
        guard current == self.password else { return }
        
        self.password = new
    }
}

class NotificationsManager {
    static let shared = NotificationsManager()
    
    var isNotificationsEnabled = false
    
    func enableNotifications() {
        self.isNotificationsEnabled = true
        print("Notifications has been enabled")
    }
    
    func disableNotifications() {
        self.isNotificationsEnabled = false
        print("Notifications has been disabled")
    }
}
