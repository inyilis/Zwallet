//
//  RefreshTokenResponse.swift
//  Core
//
//  Created by MacBook on 28/05/21.
//

import Foundation

public struct RefreshTokenResponse: Codable {
    public var status: Int
    public var message: String
    public var data: RefreshTokenDataResponse
}
