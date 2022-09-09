//
//  PropertyCell.swift
//  AccessibilityDemo
//
//  Created by Sharma, Sahil on 2022-09-05.
//

import UIKit
import Accessibility

class PropertyCell: UITableViewCell, AXCustomContentProvider {
    
    override var accessibilityLabel: String? {
        get {
            if let prop = self.property {
                return prop.addressLine
            } else {
                return nil
            }
        }
        set { }
    }
    
    var accessibilityCustomContent: [AXCustomContent]! {
        get {
            if let prop = self.property {
                let rent = AXCustomContent(label: "Rent", value: prop.rent)
                rent.importance = .high
                let city = AXCustomContent(label: "Location", value: prop.city)
                let description = AXCustomContent(label: "Description", value: prop.desc)
                let walkScore = AXCustomContent(label: "Walk Score", value: prop.walkScrore)
                let transitScore = AXCustomContent(label: "Transit Score", value: prop.transitScore)
                let popularity = AXCustomContent(label: "Popularity", value: prop.popularity)
                return [rent, city, description, walkScore, transitScore, popularity]
            } else {
                return [AXCustomContent]()
            }
        }
        set { }
    }
    

    @IBOutlet var propImg: UIImageView!
    @IBOutlet var addressLine1: UILabel!
    @IBOutlet var city: UILabel!    
    @IBOutlet var desc: UILabel!
    @IBOutlet var walkScore: UILabel!
    @IBOutlet var transitScore: UILabel!
    @IBOutlet var popularity: UILabel!
    @IBOutlet weak var rent: UILabel!
    
    var property: Property? = nil
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PropertyCell {
    func configure(property: Property) {
        self.property = property
        addressLine1.text = property.addressLine
        city.text = property.city
        desc.text = property.desc
        walkScore.text = "Walk Score " + property.walkScrore
        transitScore.text = "Transit Score " + property.transitScore
        popularity.text = "Popularity #" + property.popularity
        
        desc.numberOfLines = 0
        desc.lineBreakMode = .byWordWrapping
        desc.sizeToFit()
        
        propImg.image = UIImage(named: property.image)
        rent.text = property.rent
    }
    
}
