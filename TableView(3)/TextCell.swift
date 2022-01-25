//
//  TextCell.swift
//  TableView(3)
//
//  Created by 中野翔太 on 2022/01/25.
//

import UIKit

class TextCell: UITableViewCell {
    static let idetifier = "TextCell"

    static func nib() -> UINib {
        return UINib(nibName: "TextCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var TextField: UITextField!


    func configur(nameLabel: String) {
        label.text = nameLabel
    }
}
