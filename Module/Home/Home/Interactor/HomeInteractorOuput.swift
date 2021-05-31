//
//  HomeInteractorOuput.swift
//  Home
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import Core

protocol HomeInteractorOuput {
    func loadedUserProfileData(userProfile: UserProfileEntity)
    func loadedTransaction(transactions: [TransactionEntity])
}
