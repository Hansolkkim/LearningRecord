//
//  MessageCell.swift
//  Flash Chat
//
//  Created by 김한솔 on 2021/12/24.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    
    override func awakeFromNib() { //initialize 해주는 메소드 -> this is going to be called when we create a new message cell from the xibFile
        super.awakeFromNib()
        
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height/4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
