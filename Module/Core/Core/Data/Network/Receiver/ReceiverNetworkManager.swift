//
//  ReceiverNetworkManager.swift
//  Core
//
//  Created by MacBook on 28/05/21.
//

import Foundation

public protocol ReceiverNetworkManager {
    func searchContactByName(name: String, completion: @escaping ([ReceiverDataResponse]?, Error?) -> ())
    func getAllContacts(completion: @escaping ([ReceiverDataResponse]?, Error?) -> ())
}
