//
//  TextCell.swift
//  TableView(3)
//
//  Created by 中野翔太 on 2022/01/25.
//

import UIKit

class TextCell: UITableViewCell, UITextFieldDelegate {
    static let idetifier = "TextCell"

    static func nib() -> UINib {
        return UINib(nibName: "TextCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        textField.placeholder = "アイウエオ"
        textField.delegate = self
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    func configur(nameLabel: String) {
        textField.text = nameLabel
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        print(textField.text!)
        m(message: textField.text!)
        return true
    }
    func m(message: String) {
        var a = textField.text
        print(a!)
    }
}
