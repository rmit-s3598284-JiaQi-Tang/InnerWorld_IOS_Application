//
//  File.swift
//  InnerWorld
//
//  Created by Jacky Tang on 29/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import Foundation

struct Diary: Codable {
    var tittle: String
    var date: String
    var mood: String
    var weather: String
    var location: String
    var photo: String
    var content: String
    init(tittle: String, date: String, mood: String, weather: String, location: String, photo: String, content: String) {
        self.tittle = tittle
        self.date = date
        self.mood = mood
        self.weather = weather
        self.location = location
        self.photo = photo
        self.content = content
    }
}
