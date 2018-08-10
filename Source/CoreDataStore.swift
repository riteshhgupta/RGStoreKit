//
//  CoreDataStore.swift
//  cachestoredemo
//
//  Created by Ritesh Gupta on 25/02/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import CoreData

open class CoreDataStore: ModelStore {
	
	public let modelName: String

	public init(modelName name: String) {
		modelName = name
	}
	
	public lazy var persistentContainer: NSPersistentContainer = {
		let container = NSPersistentContainer(name: modelName)
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			guard let error = error as NSError? else { return }
			fatalError("Unresolved error \(error), \(error.userInfo)")
		})
		return container
	}()

	public lazy var mainThreadDao: ModelDao = {
		return generateModelDao(for: mainContext)
	}()

	open func generateModelDao(for context: NSManagedObjectContext) -> CoreDataModelDao {
		return CoreDataModelDao(context: context)
	}

	public var mainContext: NSManagedObjectContext {
		return persistentContainer
			.viewContext
	}
	
	public func newBackgroundContext() -> NSManagedObjectContext {
		return persistentContainer
			.newBackgroundContext()
	}

	public func performInMainThread(_ callback: (ModelDao) -> Void) {
		let dao = mainThreadDao
		dao.write { callback(dao) }
	}

	public func performInBackgroundThread(_ callback: @escaping (ModelDao) -> Void) {
		persistentContainer.performBackgroundTask { [weak self] context in
			guard let this = self else { return }
			let dao = this.generateModelDao(for: context)
			dao.write { callback(dao) }
		}
	}
}
