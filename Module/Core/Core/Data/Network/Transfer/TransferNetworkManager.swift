//
//  TransferNetworkManager.swift
//  Core
//
//  Created by MacBook on 30/05/21.
//

import Foundation

public protocol TransferNetworkManager {
    func transfer(receiver: Int, amount: Int, notes: String, completion: @escaping (TransferDataResponse?, Error?) -> ())
}
