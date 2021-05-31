//
//  ConfirmOtpResponse.swift
//  Core
//
//  Created by MacBook on 26/05/21.
//

import Foundation

public struct ConfirmOtpResponse: Codable {
    public var status: Int
    public var message: String
    public var email: String
}
