//
//  InnerWorldTests.swift
//  InnerWorldTests
//
//  Created by Jacky Tang on 15/9/18.
//  Copyright © 2018 Linh Nguyen. All rights reserved.
//

import XCTest
@testable import InnerWorld
class InnerWorldTests: XCTestCase {
    let model = Model.shared()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testRemoveExistingDiary() {
        let initialNumberOfDiaries = model.diaries.count
        if (initialNumberOfDiaries > 0) {
            model.deleteDiary(0)
            XCTAssertEqual(model.diaries.count, initialNumberOfDiaries - 1, "Fail to remove an existing diary")
        }
        else {
            XCTAssert(true, "There's no diary to delete")
        }
    }

    func testRemoveNonExistingDiary() {
        let initialNumberOfDiaries = model.diaries.count
        model.deleteDiary(-1)
        XCTAssertEqual(model.diaries.count, initialNumberOfDiaries, "Fail to detect non existing diary")
    }

    func testAddDiary() {
        let initialNumberOfDiaries = model.diaries.count
        model.creatingDiary.title = "Created by UnitTest"
        model.creatingDiary.content = "Lorem ipsum"
        model.creatingDiary.mood = "happy"
        model.creatingDiary.weather = "partly-cloudy-day"
        model.creatingDiary.weather = "Melbourne VIC"
        model.creatingDiary.imagePath = ""
        model.addDiaryToCoreData()
        XCTAssertEqual(model.diaries.count, initialNumberOfDiaries + 1, "Fail to add a diary")
    }

    func testSaveDiary() {
        if (model.diaries.count > 0) {
            let newDiary = Diary(id: 100, title: "Changed by UnitTest", date: "", mood: "", weather: "", location: "", imagePath: "", content: "")
            model.saveDiaryToCoreData(diary: newDiary, existing: model.diaries[0])
            XCTAssertEqual("Changed by UnitTest", model.diaries[0].title, "Fail to edit a diary")
        }
        else {
            XCTAssert(true, "There's no diary to save.")
        }
    }

    func testSaveUser() {
        model.saveUser(nickname: "New nickname", password: "", hint: "Changed by UnitTest. New password: 0000")
        XCTAssertEqual("", model.user!.password, "Fail to edit user")
    }
    
}
