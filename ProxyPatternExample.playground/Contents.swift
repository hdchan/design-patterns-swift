import Foundation

protocol ViewType: class {
    func display(string: String)
}

class ViewPresenter {
    
    private let view: ViewType
    
    init(view: ViewType) {
        self.view = view
    }
    
    func set(string: String) {
        view.display(string: string)
    }
    
    deinit {
        print("deiniting presented")
    }
}

class ViewController: ViewType {
    func display(string: String) {
        print("displaying: \(string)")
    }
    
    deinit {
        print("deiniting view controller")
    }
}

class ViewProxy: ViewType {
    
    private weak var view: ViewType?
    
    init(view: ViewType) {
        self.view = view
    }
    
    func display(string: String) {
        view?.display(string: string)
    }
}

let vc = ViewController()
var vp: ViewPresenter? = ViewPresenter(view: vc)
vp!.set(string: "HI")
vp = nil
