import Foundation

protocol Target {
    func request()
}

class Client {
    
    private let target: Target
    
    init(target: Target) {
        self.target = target
    }
    
    func makeRequest() {
        target.request()
    }
}

protocol Adaptee {
    func specificRequest()
}

class Adapter: Target {
    
    private let adaptee: Adaptee
    
    init(adaptee: Adaptee) {
        self.adaptee = adaptee
    }
    
    func request() {
        self.adaptee.specificRequest()
    }
}

class LegacyService: Adaptee {
    func specificRequest() {
        print("making legacy specific request")
    }
}


let adaptee = LegacyService()
let target = Adapter(adaptee: adaptee)
let client = Client(target: target)

client.makeRequest()
