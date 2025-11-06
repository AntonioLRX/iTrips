//
//  ViewController.swift
//  iTrips
//
//  Created by Antonio Lucas Reginaldo Xavier on 03/11/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tripsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tripsTableView.dataSource = self
        tripsTableView.delegate = self
        view.backgroundColor = UIColor(
            red: 30/255, green: 59/255, blue: 119/255, alpha: 1
        )
        tripsTableView.separatorInset = .zero
        tripsTableView.layoutMargins = .zero
        tripsTableView.sectionHeaderTopPadding = 0
    }
    
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(
            style: .default, reuseIdentifier: nil
        )
        cell.textLabel?.text = "Viagem \(indexPath.row)"
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self)?.first as? HomeTableViewHeader
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
}
