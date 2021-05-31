//
//  TransferNetworkManagerImpl.swift
//  Core
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import Moya

public class TransferNetworkManagerImpl: TransferNetworkManager {
    
    public init() {} 
    
    public func transfer(receiver: Int, amount: Int, notes: String, completion: @escaping (TransferDataResponse?, Error?) -> ()) {
        let provider = MoyaProvider<TransferApi>(isRefreshToken: true)
        provider.request(.transferTo(receiver: receiver, amount: amount, notes: notes)) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let transferResponse = try decoder.decode(TransferResponse.self, from: result.data)
                    completion(transferResponse.details, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
}
