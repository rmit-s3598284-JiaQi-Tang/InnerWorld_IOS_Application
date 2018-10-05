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
    var user: User!
    var diaryLocations = [String]()
    var creatingDiary: Diary
    var readingDiary: Diary_CD!
    var city: String = "Melbourne"
    var state: String = "VIC"
    
    var diaries = [Diary_CD]()
    var filteredDiaries = [Diary_CD]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedContext: NSManagedObjectContext
    
    var darkSkyApiData = ApiWeather()
    var darkSkyApi = DarkSkyApi.shared()
    var lat: Double
    var lng: Double
    
    var searchTitle = ""
    var searchLocation = ""
    var searchMood = ""
    var searchDate = ""
//    var searchDate = Date()
    
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
        creatingDiary = Diary()
        lat = 0;
        lng = 0;
        
        managedContext = appDelegate.persistentContainer.viewContext
        loadDiariesFromCoreData()
        filteredDiaries = diaries
        filteredDiaries = filteredDiaries.reversed()
        
        checkFirstTimeUser()
        fetchUser()
        loadDiariesLocation()
    }
    
    func setLatLng (_lat: Double, _lng: Double) {
        lat = _lat
        lng = _lng
        
        darkSkyApi.load(latitude: lat, longitude: lng)
    }
    
    func finishLoadingApi (data: ApiWeather) {
        darkSkyApiData = data
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
        existing.setValue(diary.title, forKey: "title")
        existing.setValue(diary.content, forKey: "content")
        existing.setValue(diary.mood, forKey: "mood")
        existing.setValue(diary.weather, forKey: "weather")
        existing.setValue(diary.location, forKey: "location")
        let _ = saveImageDiary(diary: diary)
        existing.setValue(diary.imagePath, forKey: "photo")
        updateDb()
    }
    
    func addDiaryToCoreData() {
        let entity = NSEntityDescription.entity(forEntityName: "Diary_CD", in: managedContext)
        let newDiary = NSManagedObject(entity: entity!, insertInto: managedContext) as! Diary_CD
        let _ = saveImageDiary(diary: creatingDiary)
        newDiary.setValue(creatingDiary.title, forKey: "title")
        newDiary.setValue(creatingDiary.content, forKey: "content")
        newDiary.setValue(creatingDiary.mood, forKey: "mood")
        newDiary.setValue(creatingDiary.weather, forKey: "weather")
        newDiary.setValue(creatingDiary.location, forKey: "location")
        newDiary.setValue(NSDate(), forKey: "date")
        newDiary.setValue(creatingDiary.imagePath, forKey: "photo")
        diaries.append(newDiary)
        updateDb()
        creatingDiary = Diary()
    }
    
    func getDiary(_ indexPath: IndexPath) -> Diary_CD{
        return diaries[indexPath.row]
    }
    
    func getDiaryIndex(diary: Diary_CD) -> Int{
        return diaries.index(of: diary)!
    }
    
    func saveImageDiary (diary: Diary) -> Bool{
        //Use UIImage, save and change the path
        if (diary.image == nil) {
            return false;
        }
        if let image = diary.image {
            let imageName = "\(diary.title)-\(Int(arc4random_uniform(1000))).png"
            guard let data = UIImageJPEGRepresentation(image, 1) ?? UIImagePNGRepresentation(image) else {
                return false
            }
            guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
                return false
            }
            do {
                try
                    data.write(to: directory.appendingPathComponent(imageName)!)
                diary.imagePath = imageName
                return true
            } catch {
                print(error.localizedDescription)
                return false
            }
        } else {
            return false
        }
    }
    
    func filterHomePageDiaryList(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        if (searchTitle.isEmpty && searchLocation.isEmpty && searchMood.isEmpty) {
            filteredDiaries = diaries
        }
        else if (searchTitle.isEmpty) {
            filteredDiaries = diaries
            filteredDiaries = filteredDiaries.filter{ $0.date != nil }
            filteredDiaries = filteredDiaries.filter{ formatter.string(from: $0.date! as Date).localizedCaseInsensitiveContains(searchDate)}
            filteredDiaries = filteredDiaries.filter{ $0.location!.localizedCaseInsensitiveContains(searchLocation) && $0.mood!.localizedCaseInsensitiveContains(searchMood) }
        }
        else {
            if (searchLocation.isEmpty && searchMood.isEmpty) {
                filteredDiaries = diaries.filter{ $0.title!.localizedCaseInsensitiveContains(searchTitle)}
            } else {
                filteredDiaries = diaries
                filteredDiaries = filteredDiaries.filter{ $0.date != nil }
                filteredDiaries = filteredDiaries.filter{ formatter.string(from: $0.date! as Date).localizedCaseInsensitiveContains(searchDate)}
                filteredDiaries = filteredDiaries.filter{ $0.title!.localizedCaseInsensitiveContains(searchTitle) && $0.location!.localizedCaseInsensitiveContains(searchLocation) && $0.mood!.localizedCaseInsensitiveContains(searchMood) }
            }
        }
        filteredDiaries = filteredDiaries.reversed()
    }
    
    func checkFirstTimeUser () {
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            let result = try managedContext.fetch(fetchRequest)
            if (result.count < 1) {
                createUser()
            }
        }
        catch let error as NSError
        {
            print("Could not fetch: \(error)")
        }
    }
    
    func createUser() {
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)
        let newUser = NSManagedObject(entity: entity!, insertInto: managedContext) as! User
        newUser.setValue("My Nickname", forKey: "nickName")
        newUser.setValue("0000", forKey: "password")
        newUser.setValue("", forKey: "birthday")
        newUser.setValue("", forKey: "hint")
        user = newUser
        updateDb()
    }
    
    func fetchUser () {
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            let result = try managedContext.fetch(fetchRequest)
            user = result[0] as! User
        }
        catch let error as NSError
        {
            print("Could not fetch: \(error)")
        }
    }
    
    func saveUser(nickname: String, password: String, hint: String) {
        user.setValue(nickname, forKey: "nickName")
        user.setValue(password, forKey: "password")
        user.setValue(hint, forKey: "hint")
        updateDb()
    }
    
    func loadDiariesLocation () {
        let locations = diaries.map { $0.location } as! [String]
        let unique = Array<String>(Set<String>(locations))
        //conciseUniqueValues = [5, 6, 9, 7, 4]
        diaryLocations = unique
    }
}
