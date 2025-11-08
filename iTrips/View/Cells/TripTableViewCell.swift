//
//  TripTableViewCell.swift
//  iTrips
//
//  Created by Antonio Lucas Reginaldo Xavier on 07/11/25.
//

import UIKit

class TripTableViewCell: UITableViewCell {
    @IBOutlet weak var backgroundViewCell: UIView!
    @IBOutlet weak var titleTripLabel: UILabel!
    @IBOutlet weak var subtitleTripLabel: UILabel!
    @IBOutlet weak var dailyTripLabel: UILabel!
    @IBOutlet weak var priceTripLabel: UILabel!
    @IBOutlet weak var statusCancelTripLabel: UILabel!
    
    @IBOutlet weak var tripImage: UIImageView!
    
    @IBOutlet weak var priceNoDiscountLabel: UILabel!
    
    func configCell(_ trip: Trip?) {
        tripImage.image = UIImage(named: trip?.asset ?? "")
        titleTripLabel.text = trip?.titulo
        subtitleTripLabel.text = trip?.subtitulo
        priceTripLabel.text = "R$ \(trip?.preco ?? 0)"
        
        let atributteString: NSMutableAttributedString = NSMutableAttributedString(string: "R$ \(trip?.precoSemDesconto ?? 0)")
        
        atributteString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: 1,
            range: NSMakeRange(0, atributteString.length)
        )
        priceNoDiscountLabel.attributedText = atributteString
        
        if let daysNumber = trip?.diaria, let guestsNumber = trip?.hospedes {
            let daily = daysNumber == 1 ? "Diária" : "Diárias"
            let guests = guestsNumber == 1 ? "Hóspede" : "Hóspedes"
            dailyTripLabel.text = "\(daysNumber) \(daily) - \(guestsNumber) \(guests)"
        }
        DispatchQueue.main.async {
            self.backgroundViewCell.addShadow()
        }
        //statusCancelTripLabel.text = trip?.cancelamento
    }
}
