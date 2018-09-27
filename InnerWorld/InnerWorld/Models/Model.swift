//
//  Model.swift
//  InnerWorld
//
//  Created by Linh Nguyen on 27/9/18.
//  Copyright © 2018 Linh Nguyen. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Model {
    var user: User
    var diaryLocations = ["Melbourne"]
    var currentLocation: String = "Melbourne"
    var currentWeather: String = "rainning"
    var creatingDiary: Diary
    var readingDiary = Diary_CD()
    
    var diaries = [Diary_CD]()
    var filteredDiaries = [Diary_CD]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedContext: NSManagedObjectContext
    
    var search = ""
    var location = ""
    var mood = ""
    
    // Shared Properties
    private static var sharedInstance: Model = {
        let appModel = Model()
        return appModel
    }()
    
    // Accessors
    class func shared() -> Model {
        return sharedInstance
    }
    
    // Initialization
    private init() {
        user = User(nickName: "Another Dude", birthDay: "3-Dec-1993", password: "", hint: "There's no password")
        creatingDiary = Diary()
        
        managedContext = appDelegate.persistentContainer.viewContext
        loadDiariesFromCoreData()
        filteredDiaries = diaries
        filteredDiaries = filteredDiaries.reversed()
    }
    
    func updateDb() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Error updating: \(error)")
        }
    }
    
    func deleteDiary(_ index: Int) {
        let diary = diaries[index]
        diaries.remove(at: index)
        managedContext.delete(diary)
        updateDb()
    }
    
    func loadDiariesFromCoreData() {
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Diary_CD")
            let result = try managedContext.fetch(fetchRequest)
            diaries = result as! [Diary_CD]
        }
        catch let error as NSError
        {
            print("Could not fetch: \(error)")
        }
    }
    
    func saveDiaryToCoreData(diary :Diary, existing: Diary_CD) {
        existing.title = diary.title
        existing.content = diary.content
        existing.mood = diary.mood
        existing.weather = diary.weather
        existing.location = diary.location
//            existing.date = diary.date
        existing.photo = diary.photo
        updateDb()
    }
    
    func addDiaryToCoreData() {
        let entity = NSEntityDescription.entity(forEntityName: "Diary_CD", in: managedContext)
        let newDiary = NSManagedObject(entity: entity!, insertInto: managedContext) as! Diary_CD
        print("HERE")
        print(creatingDiary.title)
        print(creatingDiary.content)
        print(creatingDiary.mood)
        newDiary.setValue(creatingDiary.title, forKey: "title")
        newDiary.setValue(creatingDiary.content, forKey: "content")
        newDiary.setValue(creatingDiary.mood, forKey: "mood")
        newDiary.setValue(creatingDiary.weather, forKey: "weather")
        newDiary.setValue(creatingDiary.location, forKey: "location")
        //            newDiary.setValue(diary.date, forKey: "date")
        newDiary.setValue(creatingDiary.photo, forKey: "photo")
        diaries.append(newDiary)
        updateDb()
        creatingDiary = Diary()
    }
    
    func getDiary(_ indexPath: IndexPath) -> Diary_CD{
        return diaries[indexPath.row]
    }
    
    func saveUser(user: User){
        self.user.nickName = user.nickName
        self.user.birthDay = user.birthDay
        self.user.password = user.password
        self.user.hint = user.hint
    }
    
    func getDiaryIndex(diary: Diary_CD) -> Int{
        return diaries.index(of: diary)!
    }
    
    func filterHomePageDiaryList(){
        if (search.isEmpty && location.isEmpty && mood.isEmpty) {
            filteredDiaries = diaries
        }
        else if (search.isEmpty) {
            filteredDiaries = diaries.filter{ $0.location!.localizedCaseInsensitiveContains(location) && $0.mood!.localizedCaseInsensitiveContains(mood) }
        }
        else {
            if (location.isEmpty && mood.isEmpty) {
                filteredDiaries = diaries.filter{ $0.title!.localizedCaseInsensitiveContains(search)}
            } else {
                filteredDiaries = diaries.filter{ $0.title!.localizedCaseInsensitiveContains(search) && $0.location!.localizedCaseInsensitiveContains(location) && $0.mood!.localizedCaseInsensitiveContains(mood) }
            }
        }
        filteredDiaries = filteredDiaries.reversed()
    }
}