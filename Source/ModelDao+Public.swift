//
//  ModelDao+Public.swift
//  RGStoreKit
//
//  Created by Ritesh Gupta on 10/08/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation

public extension ModelDao {

	func object<Model>(primaryKeyValue value: Any) -> Model {
		if let object: Model = existingObject(primaryKeyValue: value) {
			return object
		} else {
			return newObject()
		}
	}
}
