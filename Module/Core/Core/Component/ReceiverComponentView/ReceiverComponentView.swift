//
//  ReceiverComponentView.swift
//  AmountInput
//
//  Created by MacBook on 29/05/21.
//

import UIKit
import Kingfisher

public class ReceiverComponentView: UIView {
    
    var id: Int?
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPhoneNumber: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    public func commonInit(){
        Bundle.main.loadNibNamed("ReceiverComponentView", owner: nil, options: nil)
        self.contentView.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    public func showData(contact: ContactsEntity){
        self.id = contact.id
        self.userName.text = contact.name
        self.userPhoneNumber.text = contact.phone
        
        let url = URL(string: contact.imageUrl)
        self.userImage.kf.setImage(with: url)
    }

}
