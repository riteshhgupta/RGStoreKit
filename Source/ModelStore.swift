//
//  ModelStore.swift
//  cachestoredemo
//
//  Created by Ritesh Gupta on 25/02/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation

public protocol ModelStore {

	var modelName: String { get }
	func performInMainThread(_ callback: (ModelDao) -> Void)
	func performInBackgroundThread(_ callback: @escaping (ModelDao) -> Void)
}
