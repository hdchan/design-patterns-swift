import Foundation

protocol Observer: AnyObject {
    func update()
}

protocol Subject {
    func attach(observer: Observer)
    func detach(observer: Observer)
    func notify()
}

class ObserverComposite: Observer {
    
    private var observers: [Observer]
    
    init(observers: [Observer]) {
        self.observers = observers
    }
    
    func update() {
        observers.forEach { $0.update() }
    }
}

class WeatherStationHeadQuarter: Subject {
    private var observers: [Observer] = []
    
    public private(set) var temperature: Int?
    
    func attach(observer: Observer) {
        observers.append(observer)
    }
    
    func detach(observer: Observer) {
        guard let index = observers.firstIndex(where: { $0 === observer }) else {
            return
        }
        observers.remove(at: index)
    }
    
    func notify() {
        guard observers.count > 0 else {
            print("No stations listening")
            return
        }
        observers.forEach { $0.update() }
    }
    
    func setTemperature(temperature: Int) {
        self.temperature = temperature
        notify()
    }
}

class LocalWeatherStation: Observer {
    private let stationNumber: Int
    private let headQuarter: WeatherStationHeadQuarter
    
    init(stationNumber: Int,  headQuarter: WeatherStationHeadQuarter) {
        self.stationNumber = stationNumber
        self.headQuarter = headQuarter
    }
    
    func update() {
        guard let temperature = headQuarter.temperature else { return }
        print("Weather station \(stationNumber) reports that it is: \(temperature) degrees")
    }
}

let hq = WeatherStationHeadQuarter()
let ws1 = LocalWeatherStation(stationNumber: 1, headQuarter: hq)
let ws2 = LocalWeatherStation(stationNumber: 2, headQuarter: hq)

let allWS = ObserverComposite(observers: [ws1, ws2])

hq.attach(observer: allWS)
hq.setTemperature(temperature: 20)

//hq.attach(observer: ws2)
//hq.setTemperature(temperature: 50)
//
//hq.detach(observer: ws1)
//hq.setTemperature(temperature: 60)
//
//hq.detach(observer: ws2)
//hq.setTemperature(temperature: 99)

