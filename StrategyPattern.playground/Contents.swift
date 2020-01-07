import Foundation

protocol Strategy {
    func execute()
}

class ConcreteStrategyA: Strategy {
    func execute() {
        print("Executing Strategy A")
    }
}

class ConcreteStrategyB: Strategy {
    func execute() {
        print("Executing Strategy B")
    }
}

class ConcreteStrategyC: Strategy {
    func execute() {
        print("Executing Strategy C")
    }
}

class Context {
    func run(strategy: Strategy) {
        strategy.execute()
    }
}

let context = Context()
let strategyA = ConcreteStrategyA()
let strategyB = ConcreteStrategyB()
let strategyC = ConcreteStrategyC()

context.run(strategy: strategyA)
context.run(strategy: strategyB)
context.run(strategy: strategyB)
