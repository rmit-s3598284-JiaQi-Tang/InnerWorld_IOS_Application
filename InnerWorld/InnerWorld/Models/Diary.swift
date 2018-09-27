//
//  File.swift
//  InnerWorld
//
//  Created by Jacky Tang on 29/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import Foundation

class Diary: Codable {

//    typealias T = Diary

    var id: Int
    var title: String
    var date: String
    var mood: String
    var weather: String
    var location: String
    var photo: String
    var content: String

    init(id: Int, title: String, date: String, mood: String, weather: String, location: String, photo: String, content: String) {
        self.id = id;
        self.title = title
        self.date = date
        self.mood = mood
        self.weather = weather
        self.location = location
        self.photo = photo
        self.content = content

    }

    convenience init() {
        self.init(id: -1, title: "", date: "", mood: "", weather: "", location: "", photo: "", content: "")
    }
    
    convenience init(diary :Diary_CD) {
        self.init(id: -1, title: diary.title!, date: "", mood: diary.mood!, weather: diary.weather!, location: diary.location!, photo: diary.photo!, content: diary.content!)
    }
}
