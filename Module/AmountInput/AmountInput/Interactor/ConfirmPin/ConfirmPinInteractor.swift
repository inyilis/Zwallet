//
//  ConfirmPinInteractor.swift
//  AmountInput
//
//  Created by MacBook on 30/05/21.
//

import Foundation

protocol ConfirmPinInteractor {
    func transferTo(receiver: Int, amount: Int, notes: String)
}
