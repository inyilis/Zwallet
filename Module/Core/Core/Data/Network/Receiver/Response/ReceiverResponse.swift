//
//  ReceiverResponse.swift
//  Core
//
//  Created by MacBook on 28/05/21.
//

import Foundation

public struct ReceiverResponse: Codable {
    public var status: Int
    public var data: [ReceiverDataResponse]
}
