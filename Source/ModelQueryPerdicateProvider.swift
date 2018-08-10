//
//  ModelQueryPerdicateProvider.swift
//  cachestoredemo
//
//  Created by Ritesh Gupta on 25/02/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation

public protocol ModelQueryPerdicateProvider {
	
	var predicate: NSPredicate { get }
}
