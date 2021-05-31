//
//  ContactsCell.swift
//  Receiver
//
//  Created by MacBook on 28/05/21.
//

import UIKit
import Kingfisher

public class ContactsCell: UITableViewCell {
    
    var id: Int?
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPhone: UILabel!
    
    public var delegate: ContactsCellDelegate?
    public var contact: ContactsEntity?
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.dropShadowEffect()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        cellView.addGestureRecognizer(tapGesture)
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func showData(contact: ContactsEntity){
        self.contact = contact
        
        self.id = contact.id
        self.userName.text = contact.name
        self.userPhone.text = contact.phone
        
        let url = URL(string: contact.imageUrl)
        self.userImage.kf.setImage(with: url)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.delegate?.inputAmountForTransfer(contact: contact!)
    }
    
}
