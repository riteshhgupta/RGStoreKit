//
//  ModelQueryComparator.swift
//  RGStoreKit
//
//  Created by Ritesh Gupta on 10/08/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation

public enum ModelQueryComparator: String {

	case equal = " = "
	case moreThan = " > "
	case lessThan = " < "
	case moreEqualThan = " >= "
	case lessEqualThan = " <= "
	case notEqual = " != "
	case contains = " CONTAINS[c] "
	case beginsWith = " BEGINSWITH[c] "
	case like = " LIKE[c] "
}
