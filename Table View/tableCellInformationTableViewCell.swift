//
//  tableCellInformationTableViewCell.swift
//  Table View
//
//  Created by suryasoft konsultama on 5/29/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import UIKit

class tableCellInformationTableViewCell: UITableViewCell {

    public static let kNAME:String = "tableCellInformationTableViewCell"
    public static let kRECYCLE:String = "tableCellInformationTableViewCell"
    
    
    
    @IBOutlet weak var _imageViewDetail: UIImageView!
    
    @IBOutlet weak var _labelDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _labelDetail.text = "awake from graveyard"
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
