//
//  RefreshTokenDataResponse.swift
//  Core
//
//  Created by MacBook on 28/05/21.
//

import Foundation

public struct RefreshTokenDataResponse: Codable {
    public var id: Int
    public var email: String
    public var token: String
    public var expired_in: Int
    public var expired_at: Int
    
}
