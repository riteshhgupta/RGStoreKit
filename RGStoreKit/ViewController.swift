//
//  ViewController.swift
//  RGStoreKit
//
//  Created by Ritesh Gupta on 09/08/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import UIKit
import CoreData

class SomeAppCoreDataModelDao: CoreDataModelDao {

	override func nsmanagedType<Model>(for model: Model.Type) -> CoreDataModelFetchInfoProvider.Type? {
		return User.self
	}
}

class SomeAppCoreDataStore: CoreDataStore {

	override func generateModelDao(for context: NSManagedObjectContext) -> CoreDataModelDao {
		return SomeAppCoreDataModelDao(context: context)
	}
}

class ViewController: UIViewController {

	let store: ModelStore = SomeAppCoreDataStore(modelName: "Some")

	override func viewDidLoad() {
		super.viewDidLoad()
		store.performInMainThread { dao in
			let users: [String] = dao.allObjects()
			dao.delete(models: [users])
		}
		store.performInMainThread { dao in
			let users: [String] = dao.allObjects()
			dao.delete(models: [users])
		}
		store.performInBackgroundThread { dao in
			let users: [String] = dao.allObjects()
			dao.delete(models: [users])
		}
	}
}

