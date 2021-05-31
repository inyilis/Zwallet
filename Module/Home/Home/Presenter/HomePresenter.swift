//
//  HomePresenter.swift
//  Home
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit

protocol HomePresenter {
    func transfer(viewController: UIViewController)
    func topUp(viewController: UIViewController)
    func showHistory(viewController: UIViewController)
    func loadProfile()
    func loadTransaction()
    func logout()
}
