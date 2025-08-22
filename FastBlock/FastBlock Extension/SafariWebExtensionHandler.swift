import SafariServices
import os.log

class SafariExtensionHandler: SFSafariExtensionHandler {
    
    private static let log = OSLog(subsystem: "com.fastblock.FastBlock", category: "ExtensionHandler")
    
    // Track blocking statistics
    private static var blockCount: Int {
        get { UserDefaults.standard.integer(forKey: "blockCount") }
        set { UserDefaults.standard.set(newValue, forKey: "blockCount") }
    }
    
    override func messageReceived(withName messageName: String, from page: SFSafariPage, userInfo: [String : Any]?) {
        os_log("Message received: %{public}@", log: Self.log, type: .debug, messageName)
        
        if messageName == "blockDetected" {
            Self.blockCount += 1
            os_log("Blocked item. Total blocks: %{public}d", log: Self.log, type: .info, Self.blockCount)
        }
    }
    
    override func toolbarItemClicked(in window: SFSafariWindow) {
        // This method will be called when your toolbar item is clicked
        os_log("Toolbar item clicked", log: Self.log, type: .info)
    }
    
    override func validateToolbarItem(in window: SFSafariWindow, validationHandler: @escaping ((Bool, String) -> Void)) {
        // Update toolbar badge with block count
        let badgeText = Self.blockCount > 999 ? "999+" : String(Self.blockCount)
        validationHandler(true, badgeText)
    }
    
    override func popoverViewController() -> SFSafariExtensionViewController {
        return SafariExtensionViewController.shared
    }
    
    override func contentBlocker(withIdentifier contentBlockerIdentifier: String, blockedResourcesWith urls: [URL], on page: SFSafariPage) {
        // Called when content is blocked
        Self.blockCount += urls.count
        os_log("Blocked %{public}d resources", log: Self.log, type: .info, urls.count)
    }
}
