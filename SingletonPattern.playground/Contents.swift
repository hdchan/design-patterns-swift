import Foundation

class Singleton: NSObject {
    static let instance = Singleton()
    
    private override init() {}
}
