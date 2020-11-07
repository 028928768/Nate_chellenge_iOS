//
//  ProductTableViewCell.swift
//  Nate_chellenge_iOS
//
//  Created by Kantachat Puagkajee on 07/11/2020.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var merchantLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
