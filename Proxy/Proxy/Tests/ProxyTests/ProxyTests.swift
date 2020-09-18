import XCTest
@testable import Proxy

final class ProxyTests: XCTestCase {
    func test_proxy() {
        let proxy = UserSettingsProxy()
        proxy.disableNotifications()
        proxy.enableNotifications()
        
        XCTAssertNil(proxy.real)
        
        proxy.signIn(userId: "userId", password: "password")
        XCTAssert(proxy.real?.userId == "userId")
        XCTAssert(proxy.real?.password == "password")
        proxy.signOut()
        XCTAssertNil(proxy.real)
        proxy.changePassword(current: "password", new: "newPassword")
        XCTAssertNil(proxy.real)
        
        self.test_core(userSettings: proxy)
    }
    
    func test_real() {
        let userSettings = UserSettings()        
        self.test_core(userSettings: userSettings)
    }
    
    func test_core(userSettings: UserSettable) {
        userSettings.disableNotifications()
        userSettings.enableNotifications()
        
        userSettings.signIn(userId: "userId", password: "password")
        XCTAssert(userSettings.userId == "userId")
        XCTAssert(userSettings.password == "password")
        userSettings.changePassword(current: "password", new: "newPassword")
        XCTAssert(userSettings.password == "newPassword")
        
        userSettings.signOut()
        
        XCTAssert(userSettings.userId == nil)
        XCTAssert(userSettings.password == nil)
    }
}
