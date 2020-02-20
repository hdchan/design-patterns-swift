import Foundation

protocol MediaView: AnyObject {
    var resource: MediaResource { get }
}

protocol MediaResource {
    func getTitle() -> String
    func getAuthor() -> String
    func getDescription() -> String
    func getImageURL() -> URL
}

class LongFormView: MediaView {
    var resource: MediaResource
    
    init(resource: MediaResource) {
        self.resource = resource
    }
    
    func show() {
        self.resource.getTitle()
        self.resource.getAuthor()
        self.resource.getDescription()
        self.resource.getImageURL()
    }
}

class ShortFormView: MediaView {
    var resource: MediaResource
    
    init(resource: MediaResource) {
        self.resource = resource
    }
    
    func show() {
        self.resource.getTitle()
        self.resource.getImageURL()
    }
}

class SongResource: MediaResource {
    func getTitle() -> String {
        "Song Title"
    }
    
    func getAuthor() -> String {
        "Song Author"
    }
    
    func getDescription() -> String {
        "Song Description"
    }
    
    func getImageURL() -> URL {
        URL(string: "http://song.url.com")!
    }
}

class BookResource: MediaResource {
    func getTitle() -> String {
        "Book Title"
    }
    
    func getAuthor() -> String {
        "Book Author"
    }
    
    func getDescription() -> String {
        "Book Description"
    }
    
    func getImageURL() -> URL {
        URL(string: "http://book.url.com")!
    }
}

let songResource = SongResource()
let bookResource = BookResource()

let combination1 = LongFormView(resource: songResource)
let combination2 = LongFormView(resource: bookResource)
let combination3 = ShortFormView(resource: songResource)
let combination4 = ShortFormView(resource: bookResource)

