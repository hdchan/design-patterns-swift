import Foundation

struct Feed {
    let title: String
    let description: String
    let url: URL
}

protocol Loader {
    func getFeed(completion: (Result<Feed, Error>) -> Void)
}

class RemoteLoader: Loader {
    func getFeed(completion: (Result<Feed, Error>) -> ()) {
        completion(.failure(NSError(domain: "domain", code: 2, userInfo: nil)))
    }
}

class LocalLoader: Loader {
    func getFeed(completion: (Result<Feed, Error>) -> ()) {
        completion(.success(Feed(title: "A Title", description: "A Description", url: URL(string: "www.url.com")!)))
    }
}

class Composer: Loader {
    
    private let primaryLoader: Loader
    private let fallbackLoader: Loader
    
    init(primaryLoader: Loader, fallbackLoader: Loader) {
        self.primaryLoader = primaryLoader
        self.fallbackLoader = fallbackLoader
    }
    
    func getFeed(completion: (Result<Feed, Error>) -> Void) {
        primaryLoader.getFeed { [weak self] result in
            switch result {
            case .success:
                print("success!")
                completion(result)
            case .failure:
                print("failed")
                self?.fallbackLoader.getFeed(completion: completion)
            }
        }
    }
}

let composer = Composer(primaryLoader: Composer(primaryLoader: RemoteLoader(),
                                                fallbackLoader: RemoteLoader()),
                        fallbackLoader: LocalLoader())

composer.getFeed { result in
    switch result {
    case .success(let feed):
        print(feed)
    case .failure(let error):
        print(error)
    }
}
