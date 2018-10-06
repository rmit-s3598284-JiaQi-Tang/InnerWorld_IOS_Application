//
//  File.swift
//  InnerWorld
//
//  Created by Jacky Tang on 29/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import Foundation
import UIKit

class Diary {

    var id: Int
    var title: String
    var date: String
    var mood: String
    var weather: String
    var location: String
    var imagePath: String
    var content: String
    
    var image: UIImage?

    init(id: Int, title: String, date: String, mood: String, weather: String, location: String, imagePath: String, content: String) {
        self.id = id;
        self.title = title
        self.date = date
        self.mood = mood
        self.weather = weather
        self.location = location
        self.content = content
        self.imagePath = imagePath
    }

    convenience init() {
        self.init(id: -1, title: "", date: "", mood: "", weather: "", location: "", imagePath: "", content: "")
    }
    
    convenience init(diary :Diary_CD) {
        self.init(id: -1, title: diary.title!, date: "", mood: diary.mood!, weather: diary.weather!, location: diary.location!, imagePath: diary.photo!, content: diary.content!)
    }
}
