//
//  ModelDao.swift
//  cachestoredemo
//
//  Created by Ritesh Gupta on 25/02/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation

public protocol ModelDao {
	
	func newObject<Model>() -> Model
	func existingObject<Model>(primaryKeyValue: Any) -> Model?
	func object<Model>(primaryKeyValue: Any) -> Model
	func allObjects<Model>() -> [Model]
	func objects<Model>(query: ModelQueryPerdicateProvider) -> [Model]
	func delete<Model>(models: [Model])
	func save<Model>(models: [Model])
	func write(_ callback: () -> Void)
}
