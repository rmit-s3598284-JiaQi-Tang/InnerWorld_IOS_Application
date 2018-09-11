//
//  AppEngine.swift
//  InnerWorld
//
//  Created by Jacky Tang on 30/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import Foundation

class AppEngine {

    var diaryList: [Diary]
    var user: User
    
    // Shared Properties
    private static var sharedInstance: AppEngine = {
        let appModel = AppEngine()
        return appModel
    }()
    
    // Initialization
    private init() {
        diaryList = [
            Diary(id: 1, title: "A happy day in St Kilda", date: "08-Aug-2018", mood: "smile", weather: "sunny", location: "St Kilda, Melbourne", photo: "prototype-diaryPicture", content: "Today, I went to St kilda beach with my Indian brother Manana. We took a lot of awesome pictures there! what a happy day!"),
            Diary(id: 2, title: "Lost 100$ in China Town", date: "6-Aug-2018", mood: "cry", weather: "rainning", location: "China Town, Melbourne", photo: "prototype-diaryPicture2", content: "Today, I went to China Town alone for some Chinese food. I lost my precious 100$! what a bad day!"),
            Diary(id: 3, title: "Learning Swift is fun!", date: "1-Aug-2018", mood: "happy", weather: "cloud", location: "RMIT, Melbourne", photo: "prototype-diaryPicture3", content: "Today, I went to RMIT with my friend Linh, we learned a lot IOS stuff from Fardin. what a good day!")
        ]
        user = User(nickName: "God Father", birthDay: "3-Dec-1993", password: "0000", hint: "the initial password is '0000'")
    }
    
    // Accessors
    class func shared() -> AppEngine {
        return sharedInstance
    }

    func addDiary(diary: Diary) {
        if diaryList.isEmpty {
            diaryList = [diary]
        } else {
            diaryList.append(diary)
        }
    }

    func removeDiary(tittleOfToBeDeletedDiary: String) {

        var loopIndex = 0
        for loopDiary in diaryList {
            if loopDiary.title == tittleOfToBeDeletedDiary {
                diaryList.remove(at: loopIndex)
            }
            loopIndex += 1
        }
    }
    
    func saveDiary(diary: Diary){
        let index = diaryList.index(where: {$0.id == diary.id})
        diaryList[index!] = diary
    }
}


