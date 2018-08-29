//
//  AppEngine.swift
//  InnerWorld
//
//  Created by Jacky Tang on 30/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import Foundation

struct AppEngine {
    var diaryList: [Diary]
    var user: User
    init() {
        diaryList = []
        user = User(nickName: "", birthDay: "", password: "", hint: "")
    }
    mutating func addDiary(diary: Diary) {
        if diaryList.isEmpty {
            diaryList = [diary]
        } else {
            diaryList.append(diary)
        }
    }
    mutating func removeDiary(tittleOfToBeDeletedDiary: String) {
        var loopIndex = 0
        for loopDiary in diaryList {
            if loopDiary.tittle == tittleOfToBeDeletedDiary {
                diaryList.remove(at: loopIndex)
            }
            loopIndex += 1
        }
    }
}


