//
//  CoreDataModelDao.swift
//  cachestoredemo
//
//  Created by Ritesh Gupta on 25/02/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import CoreData

open class CoreDataModelDao: ModelDao {
	
	public let context: NSManagedObjectContext

	public init(context: NSManagedObjectContext) {
		self.context = context
	}

	open func nsmanagedType<Model>(for model: Model.Type) -> CoreDataModelFetchInfoProvider.Type? {
		return nil
	}
}

public extension CoreDataModelDao {
	
	func newObject<Model>() -> Model {
		let _modelType = nsmanagedType(for: Model.self)!
		return _newObject(_modelType, context: context)
	}
	
	func existingObject<Model>(primaryKeyValue: Any) -> Model? {
		guard let _modelType = nsmanagedType(for: Model.self) else { return nil }
		return _existingObject(_modelType, for: primaryKeyValue, context: context)
	}
	
	func objects<Model>(query: ModelQueryPerdicateProvider) -> [Model] {
		guard let _modelType = nsmanagedType(for: Model.self) else { return [] }
		return _objects(_modelType, query: query, context: context)
	}
	
	func allObjects<Model>() -> [Model] {
		guard let _modelType = nsmanagedType(for: Model.self) else { return [] }
		return _objects(_modelType, context: context)
	}
	
	func delete<Model>(models: [Model]) {
		write {
			guard let nsmanagedModels = models as? [NSManagedObject] else { return }
			nsmanagedModels.forEach { context.delete($0) }
		}
	}
	
	func save<Model>(models: [Model]) {
		write {}
	}
	
	func write(_ callback: () -> Void) {
		callback()
		context.saveContext()
	}
}

private extension CoreDataModelDao {
	
	func _newObject<Model>(_ modelType: CoreDataModelFetchInfoProvider.Type, context: NSManagedObjectContext) -> Model {
		return NSEntityDescription.insertNewObject(
			forEntityName: modelType.entityName,
			into: context) as! Model
	}
	
	func _existingObject<Model>(_ modelType: CoreDataModelFetchInfoProvider.Type, for primaryKeyValue: Any, context: NSManagedObjectContext) -> Model? {
		let query = ModelAtomicQueryBuilder(
			key: modelType.primaryKey,
			value: primaryKeyValue,
			comparator: .equal
		)
		return _objects(
			modelType,
			query: query,
			fetchLimit: 1,
			context: context
			)
			.first
	}
	
	func _objects<Model>(
		_ modelType: CoreDataModelFetchInfoProvider.Type,
		query: ModelQueryPerdicateProvider,
		fetchLimit: Int = Int.max,
		context: NSManagedObjectContext) -> [Model]
	{
		return _objects(
			modelType,
			predicate: query.predicate,
			fetchLimit: fetchLimit,
			context: context
		)
	}
	
	func _objects<Model>(
		_ modelType: CoreDataModelFetchInfoProvider.Type,
		predicate: NSPredicate? = nil,
		sortDescriptors: [NSSortDescriptor]? = nil,
		fetchLimit: Int = Int.max,
		context: NSManagedObjectContext) -> [Model]
	{
		let request: NSFetchRequest<NSManagedObject> = NSFetchRequest<NSManagedObject>(entityName: modelType.entityName)
		request.predicate = predicate
		request.sortDescriptors = sortDescriptors
		request.fetchLimit = fetchLimit
		do {
			let objects = try context.fetch(request)
			return objects as! [Model]
		} catch {
			return []
		}
	}
}
