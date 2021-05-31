//
//  MoyaExtension.swift
//  Core
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import Moya

extension MoyaProvider {
    
    convenience init(isRefreshToken: Bool) {
        if isRefreshToken {
            self.init(requestClosure: MoyaProvider.endpointResolver())
        } else {
            self.init()
        }
    }
    
    static func endpointResolver() -> MoyaProvider<Target>.RequestClosure {
        return { (endpoint, closure) in
            // Getting the original request
            let request = try! endpoint.urlRequest()
            
            // assume you have the existing token samewhere
            let tokenExpiredDate: Date? = UserDefaultHelper.shared.get(key: .userTokenExpired)
            if tokenExpiredDate ?? Date() > Date() {
                closure(.success(request))
                return
            }
            
            let email: String = UserDefaultHelper.shared.get(key: .email) ?? ""
            let refreshToken: String = UserDefaultHelper.shared.get(key: .refreshToken) ?? ""
            let authNetworkManager = AuthNetworkManagerImpl()
            authNetworkManager.refreshToken(email: email, refreshToken: refreshToken) { (result, error) in
                if let refreshTokenResponse = result {
                    UserDefaultHelper.shared.set(key: .userToken, value: refreshTokenResponse.token)
                    
                    let currentDate: Date = Date()
                    // change 10 with expired in object from API
                    let tokenExpiredAt: Date = Calendar.current.date(byAdding: .second, value: refreshTokenResponse.expired_in / 1000, to: currentDate)!
                    UserDefaultHelper.shared.set(key: .userTokenExpired, value: tokenExpiredAt)
                    
                    let newEndpoint = endpoint.adding(newHTTPHeaderFields: ["Authorization": "Bearer \(refreshTokenResponse.token)"])
                    let finalRequest = try! newEndpoint.urlRequest()
                    closure(.success(finalRequest))
                } else {
                    UserDefaultHelper.shared.remove(key: .userToken)
                    UserDefaultHelper.shared.remove(key: .userTokenExpired)
                    UserDefaultHelper.shared.remove(key: .email)
                    NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
                }
            }
        }
    }
    
}
