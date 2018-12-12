//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by Gabriel Blaine Palmer on 12/11/18.
//  Copyright © 2018 Caleb Hicks. All rights reserved.
//

import Foundation

struct StoreItems: Codable {
    let results: [StoreItem]
}

struct StoreItem: Codable {
    
    let name: String
    let media: String
    let language: String?
    let artist: String
    let description: String?
    let coverImageURL: String
    
//    var printDescription: String {
//        var stuff: String = ""
//
//        if let name = name {
//            stuff += "Name: \(name)\n"
//        }
//        if let media = media {
//            stuff += "Media: \(media)\n"
//        }
//        if let language = language {
//            stuff += "Language: \(language)\n"
//        }
//        if let artist = artist {
//            stuff += "Artist: \(artist)\n"
//        }
//        if let description = description {
//            stuff += "Description: \(description)\n"
//        }
//
//        return stuff
//    }
    
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
    
//    init?(json: [String: Any]) {
//
//        guard let name = json["trackName"] as? String,
//            let artist = json["artistName"] as? String,
//            let media = json["kind"] as? String,
//            let language = json["lang"] as? String,
//            let coverImageURL = json["artworkUrl100"] as? String else { return nil }
//
//        self.name = name
//        self.artist = artist
//        self.media = media
//        self.language = language
//        self.coverImageURL = coverImageURL
//
//        self.description = json["description"] as? String ?? json["longDescription"] as? String ?? ""
//    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try valueContainer.decode(String.self, forKey: CodingKeys.name)
        self.media = try valueContainer.decode(String.self, forKey: CodingKeys.media)
        self.language = try? valueContainer.decode(String.self, forKey: CodingKeys.language)
        self.artist = try valueContainer.decode(String.self, forKey: CodingKeys.artist)
        if let description = try? valueContainer.decode(String.self, forKey: CodingKeys.description) {
            self.description = description
        } else {
            let additionalValues = try decoder.container(keyedBy: AdditionalKeys.self)
            description = (try? additionalValues.decode(String.self, forKey: AdditionalKeys.longDescription))
        }
        self.coverImageURL = try valueContainer.decode(String.self, forKey: CodingKeys.coverImageURL)
    }
}
