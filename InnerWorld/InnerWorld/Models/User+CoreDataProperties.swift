//
//  User+CoreDataProperties.swift
//  InnerWorld
//
//  Created by Linh Nguyen on 5/10/18.
//  Copyright © 2018 Linh Nguyen. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var hint: String?
    @NSManaged public var nickName: String?
    @NSManaged public var password: String?

}
