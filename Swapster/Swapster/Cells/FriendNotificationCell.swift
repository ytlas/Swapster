//
//  FriendNotificationCell.swift
//  Swapster
//
//  Created by Artemio Pánuco on 28/08/23.
//

import UIKit

class FriendNotificationCell: UITableViewCell {
    static let identifier: String = "FriendNotificationCell"

    @IBOutlet weak var iconProfile: UIImageView!
    @IBOutlet weak var viewProfile: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.viewProfile.layer.cornerRadius = viewProfile.frame.size.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //TODO: You need your cell configurator. Make it here
    
    func configurateCell() {
        
    }
    
}
