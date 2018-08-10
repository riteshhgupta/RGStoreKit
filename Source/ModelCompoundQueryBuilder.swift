//
//  ModelCompoundQueryBuilder.swift
//  RGStoreKit
//
//  Created by Ritesh Gupta on 10/08/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation

public final class ModelCompoundQueryBuilder: ModelQueryPerdicateProvider {

	public var predicate: NSPredicate

	init(with query: ModelQueryPerdicateProvider) {
		predicate = query.predicate
	}

	init(with queries: [ModelQueryPerdicateProvider], using type: NSCompoundPredicate.LogicalType) {
		predicate = NSCompoundPredicate(
			type: type,
			subpredicates: queries.map { $0.predicate }
		)
	}

	public convenience init(with keyValues: [String: Any], comparator: ModelQueryComparator, using type: NSCompoundPredicate.LogicalType) {
		let queries = keyValues.map {
			ModelAtomicQueryBuilder(
				key: $0.key,
				value: $0.value,
				comparator: comparator
			)
		}
		self.init(with: queries, using: type)
	}

	public func compound(with queries: [ModelQueryPerdicateProvider], using type: NSCompoundPredicate.LogicalType) -> ModelCompoundQueryBuilder {
		var predicates = queries.map { $0.predicate }
		predicates.insert(predicate, at: 0)
		predicate = NSCompoundPredicate(
			type: type,
			subpredicates: predicates
		)
		return self
	}
}
