//
//  NewsListCell.swift
//  testMIR
//
//  Created by Артём Балашов on 09/02/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

import UIKit
import TableKit
import SDWebImage

class NewsListCell: UITableViewCell, ConfigurableCell {
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configure(with data: NewsListItem) {
        
    }
    
}
