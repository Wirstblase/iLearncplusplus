//
//  SecondCustomTableViewCell.swift
//  iLearn c++ official
//
//  Created by Wirstblase on 27/04/2018.
//  Copyright © 2018 Wirstblase. All rights reserved.
//

import UIKit

class SecondCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var CellView2: UIView!
    @IBOutlet weak var Lbl2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
