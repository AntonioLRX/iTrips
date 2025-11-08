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
        guard let tripCell = tableView.dequeueReusableCell(withIdentifier: "TripTableViewCell") as? TripTableViewCell else {
            fatalError("Error to create table view cell")
        }
        
        let viewModel = sectionTrips?[indexPath.section]
        
        switch viewModel?.type {
            case .highlights:
                tripCell.configCell(viewModel?.trips[indexPath.row])
                return tripCell
            default:
                return UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: nil)?.first as? HomeTableViewHeader else {return nil}
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
