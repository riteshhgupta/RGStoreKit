//
//  NSManagedObjectContext.swift
//  cachestoredemo
//
//  Created by Ritesh Gupta on 25/02/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import CoreData

public extension NSManagedObjectContext {
	
	func saveContext() {
		guard hasChanges else { return }
		do {
			try save()
		} catch {
			let nserror = error as NSError
			fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
		}
	}
}
