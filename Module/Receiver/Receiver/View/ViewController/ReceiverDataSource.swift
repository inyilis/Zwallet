//
//  ReceiverDataSource.swift
//  Receiver
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit
import Core

class ReceiverDataSource: NSObject, UITableViewDataSource {
    
    var viewController: ReceivefrViewController!
    
    var searchContactByName: [ContactsEntity] = []
    var getAllContacts: [ContactsEntity] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchContactByName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath) as! ContactsCell
        cell.delegate = self.viewController
        cell.showData(contact: self.searchContactByName[indexPath.row])
        return cell
    }
    
}
