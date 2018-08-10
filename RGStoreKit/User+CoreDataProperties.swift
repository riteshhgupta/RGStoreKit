//
//  User+CoreDataProperties.swift
//  RGStoreKit
//
//  Created by Ritesh Gupta on 10/08/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//
//

import Foundation
import CoreData

extension User {

	@nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
		return NSFetchRequest<User>(entityName: "User")
	}

	@NSManaged public var name: String?
}
