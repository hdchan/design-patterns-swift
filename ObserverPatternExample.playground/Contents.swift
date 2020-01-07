import Foundation

protocol Observer: AnyObject {
    func update()
}

protocol Subject {
    func attach(observer: Observer)
    func detach(observer: Observer)
    func notify()
}

class ConcreteSubject: Subject {
    
    struct State {}
    
    var state: State = State() {
        didSet {
            notify()
        }
    }
    
    private var observers: [Observer] = []
    
    func attach(observer: Observer) {
        observers.append(observer)
    }
    
    func detach(observer: Observer) {
        guard let index = observers.firstIndex(where: { $0 === observer }) else { return }
        observers.remove(at: index)
    }
    
    func notify() {
        observers.forEach { $0.update() }
    }
}

class ConcreteObserver: Observer {
    
    private weak var subject: ConcreteSubject?
    
    init(subject: ConcreteSubject) {
        self.subject = subject
    }
    
    func update() {
        guard let state = subject?.state else { return }
        print(state)
    }
}


