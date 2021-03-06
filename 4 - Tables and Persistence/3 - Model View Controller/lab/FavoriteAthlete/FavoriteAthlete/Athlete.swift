//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Gabriel Blaine Palmer on 10/24/18.
//

import Foundation

struct Athlete {
    var name: String
    var age: Int
    var league: String
    var team: String
    
    var description: String {
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)"
    }
}
