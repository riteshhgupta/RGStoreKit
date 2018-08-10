//
//  ModelAtomicQueryBuilder.swift
//  RGStoreKit
//
//  Created by Ritesh Gupta on 10/08/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation

public struct ModelAtomicQueryBuilder {

	public let key: String
	public let value: Any
	public let comparator: ModelQueryComparator
}

extension ModelAtomicQueryBuilder: ModelQueryPerdicateProvider {

	public var predicate: NSPredicate {
		return NSPredicate(
			format: toQueryString,
			argumentArray: [value]
		)
	}
}

fileprivate extension ModelAtomicQueryBuilder {

	var toQueryString: String {
		return "\(key)"
			+ comparator.rawValue
			+ "%@"
	}
}
