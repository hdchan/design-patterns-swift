import Foundation

protocol Product {}

class ConcreteProductA: Product {}

class ConcreteProductB: Product {}

class ConcreteCreator {
    enum Property {
        case a
        case b
    }
    
    static func createProduct(property: Property) -> Product {
        switch property {
        case .a: return ConcreteProductA()
        case .b: return ConcreteProductB()
        }
    }
}

