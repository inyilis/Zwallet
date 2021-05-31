//
//  HistoryInteractorOutput.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import Core

protocol HistoryInteractorOutput {
    func loadedWeekTransaction(transactions: [TransactionEntity])
    func loadedMonthTransaction(transactions: [TransactionEntity])
}
