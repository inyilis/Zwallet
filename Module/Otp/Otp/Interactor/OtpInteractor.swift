//
//  OtpInteractor.swift
//  Otp
//
//  Created by MacBook on 26/05/21.
//

import Foundation

protocol OtpInteractor {
    func postOtpCode(email: String, otp: String)
}
