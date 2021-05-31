//
//  AmountInputViewController.swift
//  AmountInput
//
//  Created by MacBook on 29/05/21.
//

import UIKit
import Core
import Kingfisher

class AmountInputViewController: UIViewController {

    @IBOutlet weak var receiverProfileView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPhoneNumber: UILabel!
//    @IBOutlet weak var customView: ReceiverComponentView!
    @IBOutlet weak var inputAmount: UITextField!
    @IBOutlet weak var inputNotes: UITextField!
    
    var presenter: AmountInputPresenter?
    var contactProfile: ContactsEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.receiverProfileView.dropShadowEffect()
        self.showContactProfile()
    }
    
    func showContactProfile() {
        self.userName.text = contactProfile!.name
        self.userPhoneNumber.text = contactProfile!.phone

        let url = URL(string: contactProfile!.imageUrl)
        self.userImage.kf.setImage(with: url)
    }

    @IBAction func backToReceiverAction(_ sender: Any) {
        self.presenter?.backToReceiver(viewController: self)
    }
    
    @IBAction func nextAction(_ sender: Any) {
        self.presenter?.toAmountConfirm(viewController: self, contact: self.contactProfile!, amount: self.inputAmount.text!, date: dateNow.getDate, notes: self.inputNotes.text!)
    }

}
