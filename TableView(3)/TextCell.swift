//
//  TextCell.swift
//  TableView(3)
//
//  Created by 中野翔太 on 2022/01/25.
//

import UIKit
import RealmSwift

class TextCell: UITableViewCell, UITextFieldDelegate {
    static let idetifier = "TextCell"
    var count:[String] = []

    static func nib() -> UINib {
        return UINib(nibName: "TextCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        textField.placeholder = "アイウエオ"
        textField.delegate = self
        print(Realm.Configuration.defaultConfiguration.fileURL)

    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    func configur(nameLabel: String) {
        textField.text = nameLabel
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        count.append(textField.text!)
        let realm = try! Realm()
        let user = User()
        user.text = textField.text!
        try! realm.write({
            realm.add(user)
        })
        print(user)
        return true
    }
    func m(message: String) {
        let a = textField.text
        print(a!)
    }
}
