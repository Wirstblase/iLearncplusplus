//
//  SocialTableViewCell.swift
//  iLearn c++ official
//
//  Created by Macbook on 7/22/18.
//  Copyright © 2018 Wirstblase. All rights reserved.
//

import UIKit
import Foundation

class SocialTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var usernamelabel: UILabel!
    @IBOutlet weak var datalabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
