//: Playground - noun: a place where people can play

import Foundation
import PlaygroundSupport


/*:
 ## Data Modeling & Error Handling
 
 ### Data Modeling with Swift 4's new Codable Type
 
 Before Swift 4, most iOS develops would use a third party JSON library like Gloss or SwiftyJSON.
 
 Swift 4's new Codable Type, which is actually consists of two protocols, Encodable and Decodable allow us to convert JSON into Swift models and vice versa.
 
 
 Lets look at how we would download and Anime from an API and model it with JSON.
 
*/

struct Anime {
    let title: String
    let thumbnail: URL
    
    init(title: String, thumbnail: URL) {
        self.title = title
        self.thumbnail = thumbnail
    }
}

extension Anime: Decodable {
    
    // Declaring our keys
    enum Keys: String, CodingKey {
        case title
        case thumbnail
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self) // defining our (keyed) container
        let title: String = try container.decode(String.self, forKey: .title) // extracting the data
        let thumbnail: URL = try container.decode(URL.self, forKey: .thumbnail)
        
        self.init(title: title, thumbnail: thumbnail)
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true