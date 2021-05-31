//
//  StringExtension.swift
//  Core
//
//  Created by MacBook on 29/05/21.
//

import Foundation

public extension String {
    var getDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = self
        let dateNow = dateFormatter.string(from: Date())
        return "\(dateNow)"
    }
}

public let dateNow: String = "MMM dd, yyy - HH.mm"
