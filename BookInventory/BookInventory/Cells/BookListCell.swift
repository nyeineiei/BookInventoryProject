//
//  BookListCell.swift
//  BookInventory
//
//  Copyright © 2018 NyeinEi. All rights reserved.
//

import UIKit

class BookListCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblPublisher: UILabel!
    @IBOutlet weak var lblPublishDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
