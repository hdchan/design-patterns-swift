import UIKit

protocol Abstraction {
    var implementor: Implementor { get }
    func operation()
}

extension Abstraction {
    func operation() {
        implementor.operationImplementation()
    }
}

protocol Implementor {
    func operationImplementation()
}

class ConcreteAbstraction: Abstraction {
    var implementor: Implementor
    
    init(implementor: Implementor) {
        self.implementor = implementor
    }
}

class ConcreteImplementorA: Implementor {
    func operationImplementation() {
        print("serving operation implementation A")
    }
}

class ConcreteImplementorB: Implementor {
    func operationImplementation() {
        print("serving operation implementation B")
    }
}

let implementorA = ConcreteImplementorA()
let implementorB = ConcreteImplementorB()

let concreteAbstractionA = ConcreteAbstraction(implementor: implementorA)
concreteAbstractionA.operation()

let concreteAbstractionB = ConcreteAbstraction(implementor: implementorB)
concreteAbstractionB.operation()
