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
    init() {
        diaryList = []
        user = User(nickName: "", birthDay: "", password: "", hint: "")
    }
    init(diaryList: [Diary], user: User) {
        self.diaryList = diaryList
        self.user = user
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
            if loopDiary.tittle == tittleOfToBeDeletedDiary {
                diaryList.remove(at: loopIndex)
            }
            loopIndex += 1
        }
    }
}


