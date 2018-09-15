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
    let appEngine = AppEngine.shared()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testRemoveExistingDiary() {
        let initialNumberOfDiaries = appEngine.diaryList.count
        appEngine.removeDiary(tittleOfToBeDeletedDiary : appEngine.diaryList[0].title)
        XCTAssertEqual(appEngine.diaryList.count, initialNumberOfDiaries - 1, "fail to remove an existing diary")
    }

    func testRemoveNonExistingDiary() {
        let initialNumberOfDiaries = appEngine.diaryList.count
        appEngine.removeDiary(tittleOfToBeDeletedDiary : "ASHANJS")
        XCTAssertEqual(appEngine.diaryList.count, initialNumberOfDiaries, "Fail to detect non existing diary")
    }

    func testAddDiary() {
        let initialNumberOfDiaries = appEngine.diaryList.count
        let diary = Diary(id: 100, title: "A happy day in St Kilda", date: "08-Aug-2018", mood: "awesome", weather: "sunny", location: "St Kilda, Melbourne", photo: "prototype-diaryPicture", content: "Today, I went to St kilda beach with my Indian brother Manana. We took a lot of awesome pictures there! what a happy day!")
        appEngine.addDiary(diary: diary)
        XCTAssertEqual(appEngine.diaryList.count, initialNumberOfDiaries + 1, "Fail to add a diary")
    }

    func testSaveDiary() {
        var diary = appEngine.diaryList[0]
        diary.title = "Another Title"
        appEngine.saveDiary(diary: diary)
        XCTAssertEqual("Another Title", appEngine.diaryList[0].title, "Fail to edit a diary")
    }

    func testSaveUser() {
        var user = appEngine.user
        user.password = "1234"
        appEngine.saveUser(user: user)
        XCTAssertEqual("1234", appEngine.user.password, "Fail to edit user")
    }

    func testFilterBySearchBar() {
        appEngine.filterHomePageDiaryList(search: "Town", location: "", mood: "")
        XCTAssertEqual(1, appEngine.filteredDiaryList.count, "Fail to filter diaries")
    }
    
}
