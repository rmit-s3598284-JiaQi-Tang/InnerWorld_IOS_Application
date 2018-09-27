//
//  Diary_CD+CoreDataClass.swift
//  InnerWorld
//
//  Created by Linh Nguyen on 27/9/18.
//  Copyright © 2018 Linh Nguyen. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(Diary_CD)
public class Diary_CD: NSManagedObject {
    
    func getUiImage() -> UIImage? {
        let named = self.photo
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named!).path)
        }
        return nil
    }
}
