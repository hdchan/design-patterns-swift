import Foundation

protocol Component {
    func operation()
}

class Leaf: Component {
    func operation() {
        print("operation")
    }
}

class Composite: Component {
    var components: [Component]
    
    init(components: [Component]) {
        self.components = components
    }
    
    func operation() {
        components.forEach { $0.operation() }
    }
}

let composite = Composite(components: [
    Composite(components: [Leaf(), Leaf()]),
    Composite(components: [Leaf(), Leaf()])
])

composite.operation()
