//
//  User+CoreDataClass.swift
//  RGStoreKit
//
//  Created by Ritesh Gupta on 10/08/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {}

extension User: CoreDataModelFetchInfoProvider {

	public static var primaryKey: String { return "name" }
}
