//
//  ViewController.swift
//  TableView(3)
//
//  Created by 中野翔太 on 2022/01/25.
import UIKit
import SwiftUI
// 値を格納する
private struct ViewState {
    var gameScores: [Int]
    var totalScore: Int {
        gameScores.reduce(0, +)
    }
}
final class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
                            // 初期値が指定されていないので
    private var state  = ViewState(
        gameScores: [0, 0, 0, 0, 0]
    )

}
extension ViewController: UITableViewDataSource {
    // ViewControllerで処理をする
    enum Section: Int {
        case games
        case total

        var cellIdentifier: String {
            switch self {
            case .games:
                return "GameCell"
            case .total:
                return "TotalCell"
            }
        }
    }
        func numberOfSections(in tableView: UITableView) -> Int {
            return [Section.games, Section.total].count
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            guard let section = Section(rawValue: section) else { return 0 }
            switch section {
            case .games:
                return state.gameScores.count
            case .total:
                return 1
            }

        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // indexPath.sectionとは
            guard let section = Section(rawValue: indexPath.section) else { return UITableViewCell() }
            switch section {
            case .games:
                let cell = tableView.dequeueReusableCell(withIdentifier: section.cellIdentifier, for: indexPath) as! GameCell
                cell.configure(gameIndex: indexPath.row,
                               score: state.gameScores[indexPath.row],
                               // クロージャーについて
                               didChangeStepperValue: { [weak self] newScore in
                    self?.state.gameScores[indexPath.row] = newScore
                    // 何これ
                    self?.tableView.reloadRows(at: [indexPath], with: .none)
                    self?.tableView.reloadSections([Section.total.rawValue], with: .none)
                }
            )
                return cell
            case .total:
                let cell = tableView.dequeueReusableCell(withIdentifier: section.cellIdentifier, for: indexPath) as! TotalCell
                cell.configure(totalScore: state.totalScore)
                return cell
            }
        }

}


