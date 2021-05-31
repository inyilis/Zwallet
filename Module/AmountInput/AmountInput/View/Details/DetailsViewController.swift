//
//  DetailsViewController.swift
//  AmountInput
//
//  Created by MacBook on 30/05/21.
//

import UIKit
import Core
import Kingfisher

class DetailsViewController: UIViewController {

    @IBOutlet weak var amountView: UIView!
    @IBOutlet weak var balanceView: UIView!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var notesView: UIView!
    @IBOutlet weak var profileView: UIView!
    
    @IBOutlet weak var imageStatus: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var wrongPin: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactPhoneNumber: UILabel!
    
    var presenter: DetailsPresenter?
    var contactProfile: ContactsEntity?
    var amount: String?
    var balance: String?
    var date: String?
    var notes: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountView.dropShadowEffect()
        balanceView.dropShadowEffect()
        dateView.dropShadowEffect()
        notesView.dropShadowEffect()
        profileView.dropShadowEffect()
        
        showDetailsTransfer() 
    }
    
    func showDetailsTransfer() {
//        imageStatus.image = UIImage(named: "success")
        statusLabel.text = "Transfer Success"
        wrongPin.isHidden = true
        
        amountLabel.text = amount
        balanceLabel.text = balance
        dateLabel.text = date
        notesLabel.text = notes
        
        let url = URL(string: contactProfile!.imageUrl)
        contactImage.kf.setImage(with: url)
        contactName.text = contactProfile?.name
        contactPhoneNumber.text = contactProfile?.phone
    }
    
    @IBAction func btnAction(_ sender: Any) {
        self.presenter?.backToHome()
    }

}
