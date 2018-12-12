import UIKit
import PlaygroundSupport

// Part One: HTTP, URLs, and URL Session

PlaygroundPage.current.needsIndefiniteExecution = true

extension URL {
    
    func withQueries(_ queries: [String: String]) -> URL? {
        
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap { URLQueryItem(name: $0, value: $1) }
        return components?.url
    }
}

struct StoreItems: Codable {
    let results: [StoreItem]
}

struct StoreItem: Codable {
    
    let name: String?
    let media: String?
    let language: String?
    let artist: String?
    let description: String?
    let coverImageURL: String?
    
    var printDescription: String {
        var stuff: String = ""
        
        if let name = name {
            stuff += "Name: \(name)\n"
        }
        if let media = media {
            stuff += "Media: \(media)\n"
        }
        if let language = language {
            stuff += "Language: \(language)\n"
        }
        if let artist = artist {
            stuff += "Artist: \(artist)\n"
        }
        if let description = description {
            stuff += "Description: \(description)\n"
        }
        
        return stuff
    }

    enum CodingKeys: String, CodingKey {
        case name = "trackName"
        case media = "kind"
        case language = "lang"
        case artist = "artistName"
        case description = "shortDescription"
        case coverImageURL = "artworkUrl100"
        
    }
    
    enum AdditionalKeys: String, CodingKey {
        case longDescription // = "longDescription"
    }

    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try? valueContainer.decode(String.self, forKey: CodingKeys.name)
        self.media = try? valueContainer.decode(String.self, forKey: CodingKeys.media)
        self.language = try? valueContainer.decode(String.self, forKey: CodingKeys.language)
        self.artist = try? valueContainer.decode(String.self, forKey: CodingKeys.artist)
        if let description = try? valueContainer.decode(String.self, forKey: CodingKeys.description) {
            self.description = description
        } else {
            let additionalValues = try decoder.container(keyedBy: AdditionalKeys.self)
            description = (try? additionalValues.decode(String.self, forKey: AdditionalKeys.longDescription))
        }
        self.coverImageURL = try valueContainer.decode(String.self, forKey: CodingKeys.coverImageURL)
    }
}

func fetchItems(matching query: [String : String], completion: @escaping ([StoreItem]?) -> Void) {
    
    let baseURL = URL(string: "https://itunes.apple.com/search?")!
    guard let searchURL = baseURL.withQueries(query) else {
        completion(nil)
        print("Unable to generate URL with queries")
        return
    }
    
    URLSession.shared.dataTask(with: searchURL) { (data, response, error) in
        let decoder = JSONDecoder()
        
        if let data = data {
            
            if let stuff: StoreItems = try? decoder.decode(StoreItems.self, from: data) {
                completion(stuff.results)
            } else {
                print("Unable to decode StoreItems")
                completion(nil)
                return
            }
            
        } else {
            print("No data recieved")
            print(error as Any)
            completion(nil)
            return
        }
        
        }.resume()
}

let query: [String: String] = [
    "term" : "shrek",
    "media" : "movie",
    "lang" : "en_us",
    "limit" : "5"
]

fetchItems(matching: query) { (results) in
    if let results = results {
        for result in results {
            print(result.printDescription)
        }
    }
    PlaygroundPage.current.finishExecution()
}
/*:
 
 _Copyright © 2017 Apple Inc._
 
 _Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:_
 
 _The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._
 
 _THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE._
 */
