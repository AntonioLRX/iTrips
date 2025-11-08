//
//  ViewController.swift
//  iTrips
//
//  Created by Antonio Lucas Reginaldo Xavier on 03/11/25.
//

import UIKit



class ViewController: UIViewController {
    @IBOutlet weak var tripsTableView: UITableView!
    
    let IDENTIFIER = "TripTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        view.backgroundColor = UIColor(
            red: 30/255, green: 59/255, blue: 119/255, alpha: 1
        )
        
    }
    
    func configTableView() {
        tripsTableView.register(
            UINib(nibName: IDENTIFIER, bundle: nil),
            forCellReuseIdentifier: IDENTIFIER
        )
        tripsTableView.dataSource = self
        tripsTableView.delegate = self
        tripsTableView.separatorInset = .zero
        tripsTableView.layoutMargins = .zero
        tripsTableView.sectionHeaderTopPadding = 0
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionTrips?[section].numberLines ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tripCell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER) as? TripTableViewCell else {
            fatalError("Error to create table view cell")
        }
        
        return tripCell
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
