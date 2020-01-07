import Foundation

protocol Subject {
    func request()
}

class RealSubject: Subject {
    func request() {
        print("making real request")
    }
}

class Proxy: Subject {
    private lazy var realSubject: RealSubject = {
        return RealSubject()
    }()
    
    func request() {
        realSubject.request()
    }
}

class Client {
    private let subject: Subject
    
    init(subject: Subject) {
        self.subject = subject
    }
    
    func subjectRequest() {
        self.subject.request()
    }
}

let proxy = Proxy()
let client = Client(subject: proxy)
client.subjectRequest()
