//
//  FVDebugTableViewCell.swift
//  FVDebugDataBrowser
//
//  Created by Fong Zhou on 07/08/2018.
//

import UIKit

/// Basic key-value cell
class FVDebugTableViewCell: UITableViewCell {

    static let identifier = "FVDebugTableViewCell"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        nameLabel.text = ""
        valueLabel.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
