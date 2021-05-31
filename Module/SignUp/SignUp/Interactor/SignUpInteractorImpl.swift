//
//  SignUpInteractorImpl.swift
//  SignUp
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import Core

class SignUpInteractorImpl: SignUpInteractor {
    
    var interactorOutput: SignUpInteractorOutput?
    let authNetworkManager: AuthNetworkManager
    
    init(networkManager: AuthNetworkManager) {
        self.authNetworkManager = networkManager
    }
    
    func postSignUpData(username: String, email: String, password: String) {
        self.authNetworkManager.signUp(username: username, email: email, password: password) { data, error in
            if data?.status == 200 {
                self.interactorOutput?.authenticationResult(isSuccess: true)
            } else {
                self.interactorOutput?.authenticationResult(isSuccess: false)
            }
        }
    }
    
}
