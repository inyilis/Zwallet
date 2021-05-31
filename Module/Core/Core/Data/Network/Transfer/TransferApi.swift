//
//  TransferApi.swift
//  Core
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import Moya

public enum TransferApi {
    case transferTo(receiver: Int, amount: Int, notes: String)
}

extension TransferApi: TargetType {
    public var baseURL: URL {
        return URL(string: AppConstant.baseUrl)!
    }
    
    public var path: String {
        switch self {
        case .transferTo:
            return "/tranfer/newTranfer"
        }
    }
    
    public var method: Moya.Method {
        return .post
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .transferTo(receiver: let receiver, amount: let amount, notes: let notes):
            return .requestParameters(parameters: ["receiver": receiver, "amount": amount, "notes": notes], encoding: JSONEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        let pin: String = UserDefaultHelper.shared.get(key: .confirmPin) ?? ""
        return [
            "Containt-Type": "application/json",
            "Authorization": "Bearer \(token)",
            "x-access-PIN": "\(pin)"
        ]
    }
    
}
