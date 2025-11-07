//
//  HomeTableViewHeader.swift
//  iTrips
//
//  Created by Antonio Lucas Reginaldo Xavier on 04/11/25.
//

import UIKit

class HomeTableViewHeader: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func layoutSubviews() {
            super.layoutSubviews()
            configView()
    }
    
    func configView() {
        headerView.backgroundColor = UIColor(
            red: 30/255, green: 59/255, blue: 119/255, alpha: 1
        )
        bannerView.layer.cornerRadius = 10
        bannerView.layer.masksToBounds = true
        
        headerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        headerView.layer.cornerRadius = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 500 : 200
        
    }
}
