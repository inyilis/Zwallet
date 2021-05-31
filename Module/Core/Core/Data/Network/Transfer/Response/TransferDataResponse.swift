//
//  TransferDataResponse.swift
//  Core
//
//  Created by MacBook on 30/05/21.
//

import Foundation

public struct TransferDataResponse: Codable {
    public var sender: Int
    public var receiver: Int
    public var amount: Int
    public var notes: String
    public var type: Int
}
