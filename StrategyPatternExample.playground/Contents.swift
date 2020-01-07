import Foundation


protocol MakingNoiseBehavior {
    func makeNoise() -> String
}

class MakingNoiseBehaviorFactory {
    static func forRoaring() -> MakingNoiseBehavior {
        class Behavior: MakingNoiseBehavior {
            func makeNoise() -> String {
                return "Roaring"
            }
        }
        return Behavior()
    }
    
    static func forMeowing() -> MakingNoiseBehavior {
        class Behavior: MakingNoiseBehavior {
            func makeNoise() -> String {
                return "Meowing"
            }
        }
        return Behavior()
    }
    
    static func forBarking() -> MakingNoiseBehavior {
        class Behavior: MakingNoiseBehavior {
            func makeNoise() -> String {
                return "Barking"
            }
        }
        return Behavior()
    }
    
    static func forTalking() -> MakingNoiseBehavior {
        class Behavior: MakingNoiseBehavior {
            func makeNoise() -> String {
                return "Talking"
            }
        }
        return Behavior()
    }
}

protocol WalkingBehavior {
    func walk() -> String
}

class WalkingBehaviorFactory {
    static func forTwoLegs() -> WalkingBehavior {
        class Behavior: WalkingBehavior {
            func walk() -> String {
                return "Two Legs"
            }
        }
        return Behavior()
    }
    static func forFourLegs() -> WalkingBehavior {
        class Behavior: WalkingBehavior {
            func walk() -> String {
                return "Four Legs"
            }
        }
        return Behavior()
    }
}

protocol AnimalType {
    var name: String { get }
    var makingNoiseBehavior: MakingNoiseBehavior { get }
    var walkingBehavior: WalkingBehavior { get }
    func walkAndTalk()
}

extension AnimalType {
    func walkAndTalk() {
        print("A \(name) is walking on \(walkingBehavior.walk()) and \(makingNoiseBehavior.makeNoise())")
    }
}

class Animal: AnimalType {
    var name: String
    var makingNoiseBehavior: MakingNoiseBehavior
    var walkingBehavior: WalkingBehavior
    
    init(name: String, makingNoiseBehavior: MakingNoiseBehavior, walkingBehavior: WalkingBehavior) {
        self.name = name
        self.makingNoiseBehavior = makingNoiseBehavior
        self.walkingBehavior = walkingBehavior
    }
}

class AnimalFactory {
    static func forHouseCat() -> AnimalType {
        return Animal(name: "Cat",
                      makingNoiseBehavior: MakingNoiseBehaviorFactory.forMeowing(),
                      walkingBehavior: WalkingBehaviorFactory.forFourLegs())
    }
    
    static func forLion() -> AnimalType {
        return Animal(name: "Lion",
                      makingNoiseBehavior: MakingNoiseBehaviorFactory.forRoaring(),
                      walkingBehavior: WalkingBehaviorFactory.forFourLegs())
    }
    
    static func forDog() -> AnimalType {
        return Animal(name: "Dog",
                      makingNoiseBehavior: MakingNoiseBehaviorFactory.forBarking(),
                      walkingBehavior: WalkingBehaviorFactory.forFourLegs())
    }
    
    static func forHuman() -> AnimalType {
        return Animal(name: "Human",
                      makingNoiseBehavior: MakingNoiseBehaviorFactory.forTalking(),
                      walkingBehavior: WalkingBehaviorFactory.forTwoLegs())
    }
}

AnimalFactory.forHuman().walkAndTalk()
AnimalFactory.forDog().walkAndTalk()
AnimalFactory.forLion().walkAndTalk()
AnimalFactory.forHouseCat().walkAndTalk()
