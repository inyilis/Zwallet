//
//  ReceiverNetworkManagerImpl.swift
//  Core
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import Moya

public class ReceiverNetworkManagerImpl: ReceiverNetworkManager {
    
    public init() {}
    
    public func searchContactByName(name: String, completion: @escaping ([ReceiverDataResponse]?, Error?) -> ()) {
        let provider = MoyaProvider<ReceiverApi>(isRefreshToken: true)
        provider.request(.searchContactByName(name: name)) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let searchContactResponse = try decoder.decode(ReceiverResponse.self, from: result.data)
                    completion(searchContactResponse.data, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func getAllContacts(completion: @escaping ([ReceiverDataResponse]?, Error?) -> ()) {
        let provider = MoyaProvider<ReceiverApi>(isRefreshToken: true)
        provider.request(.getAllContacts) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let getAllContactsResponse = try decoder.decode(ReceiverResponse.self, from: result.data)
                    completion(getAllContactsResponse.data, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    
}
