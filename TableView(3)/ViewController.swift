//
//  ViewController.swift
//  TableView(3)
//
//  Created by 中野翔太 on 2022/01/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate {


    @IBOutlet weak var tableView: UITableView!
    var count:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TextCell.nib(), forCellReuseIdentifier: TextCell.idetifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TextCell.idetifier, for: indexPath)
        return cell
    }

    @IBAction func addButton(_ sender: Any) {
        count += [""]
        tableView.reloadData()
    }
    
}

