//
//  IntExtension.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public extension Int {
    func formatToIdr() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        
        if let formattedAmount = formatter.string(from: self as NSNumber) {
            return "Rp \(formattedAmount)"
        } else {
            return "Rp \(self)"
        }
    }
}

public extension String {
    func formatToInt() -> Int {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id")
        formatter.numberStyle = .decimal
        
        let number: NSNumber? = formatter.number(from: self) ?? 0
        return number as! Int
    }
}
