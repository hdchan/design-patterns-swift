import Foundation

protocol CommandType {
    func execute()
}

class Invoker {
    private var commands: [CommandType] = []
    
    func setCommand(command: CommandType) {
        command.execute()
        commands.append(command)
    }
}

class Receiver {
    func action1() {
        print("performing action 1")
    }
    
    func action2() {
        print("performing action 2")
    }
}

class ConcreteCommand1: CommandType {
    private let receiver: Receiver
    
    init(receiver: Receiver) {
        self.receiver = receiver
    }
    
    func execute() {
        receiver.action1()
    }
}

class ConcreteCommand2: CommandType {
    private let receiver: Receiver
    
    init(receiver: Receiver) {
        self.receiver = receiver
    }
    
    func execute() {
        receiver.action2()
    }
}

let receiver = Receiver()
let command1 = ConcreteCommand1(receiver: receiver)
let command2 = ConcreteCommand2(receiver: receiver)
let invoker = Invoker()
invoker.setCommand(command: command1)
invoker.setCommand(command: command2)
