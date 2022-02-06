//
//  TotalCell.swift
//  TableView(3)
//
//  Created by 中野翔太 on 2022/02/06.
//

import UIKit

class TotalCell: UITableViewCell {

    @IBOutlet weak var totalScoreLabel: UILabel!
    func configure(totalScore: Int) {
        totalScoreLabel.text = String(totalScore)
    }
}
