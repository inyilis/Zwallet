//
//  GetBalanceResponse.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public struct GetBalanceResponse: Codable {
    public var status: Int
    public var message: String
    public var data: [GetBalanceDataResponse]
}
