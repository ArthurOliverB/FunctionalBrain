//
//  MainTableViewCell.swift
//  PC maps
//
//  Created by Arthur Bandeira on 16/05/17.
//  Copyright © 2017 Arthur Bandeira. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bind(customer : Customer){
        self.emailLabel.text = customer.email
        self.nameLabel.text = customer.name
    }

}
