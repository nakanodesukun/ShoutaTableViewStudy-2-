//
//  TextCell.swift
//  TableView(3)
//
//  Created by 中野翔太 on 2022/01/25.
//

import UIKit
import RealmSwift

final class GameCell: UITableViewCell  {

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    private var didchangeStepperValueHandler: (Int) -> Void = { _ in }

    @IBAction func didchangeStepperValue(_ sender: Any) {
        didchangeStepperValueHandler(Int(stepper.value))
    }
// cellクラスは具体的な処理をしないで外部に処理を投げる
    func configure(gameIndex: Int,
                   score: Int,
                   didChangeStepperValue: @escaping (Int) -> Void )  {
        gameLabel.text = "Game\(gameIndex + 1)"
        scoreLabel.text = String(score)
        didchangeStepperValueHandler = didChangeStepperValue
    }




}
