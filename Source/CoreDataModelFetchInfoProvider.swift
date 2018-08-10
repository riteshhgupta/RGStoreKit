//
//  CoreDataModelFetchInfoProvider.swift
//  cachestoredemo
//
//  Created by Ritesh Gupta on 25/02/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import CoreData

public protocol CoreDataModelFetchInfoProvider: class, NSFetchRequestResult {
	
	static var primaryKey: String { get }
	static var entityName: String { get }
	static var defaultSortingKey: String? { get }
	static var isSortOrderAscending: Bool { get }
}

public extension CoreDataModelFetchInfoProvider {
	
	static var entityName: String { return String(describing: self) }
	static var defaultSortingKey: String? { return nil }
	static var isSortOrderAscending: Bool { return true }
}
