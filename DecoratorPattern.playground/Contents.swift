import Foundation

protocol Component {
    func operation()
}

class Decorator: Component {
    let component: Component
    
    init(component: Component) {
        self.component = component
    }
    
    func operation() {
        fatalError("Operation was not implemented")
    }
}

class ConcreteComponent: Component {
    func operation() {
        print("Concrete Component")
    }
}

class ConcreteDecoratorA: Decorator {
    override func operation() {
        self.component.operation()
        print("Concrete Decorator A")
    }
}

class ConcreteDecoratorB: Decorator {
    override func operation() {
        self.component.operation()
        print("Concrete Decorator B")
    }
}

let concreteComponent = ConcreteComponent()
let concreteDecoratorA = ConcreteDecoratorA(component: concreteComponent)
let concreteDecoratorB = ConcreteDecoratorB(component: concreteDecoratorA)

concreteDecoratorB.operation()
