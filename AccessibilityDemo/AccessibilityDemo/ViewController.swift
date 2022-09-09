//
//  ViewController.swift
//  AccessibilityDemo
//
//  Created by Sharma, Sahil on 2022-09-05.
//

import UIKit
import Accessibility

class ViewController: UITableViewController {

    
    
    var address = [Property]() {
        didSet {
        self.tableView.reloadData()
      }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
                UINib(nibName: "PropertyCell", bundle: nil),
                forCellReuseIdentifier: "PropertyCell")
        
        //var address = ["123 Main St", "345 Center St", "454 West 54th Ave", "723 7th St", "142 5th Ave"]
        let address1 = Property(addressLine: "123 Main St", city: "Calgary, Alberta", desc: "For a limited time offer! Sign a 1 year lease before October 30, 2022 and receive up to 6 months rent free", walkScrore: "6.1", transitScore: "7.2", popularity: "82", image: "Property1", rent: "$900")
        let address2 = Property(addressLine: "345 Center St", city: "Calgary, Alberta", desc: "Boasting diverse amenities, spacious suites and a walkable location close to everything you need.", walkScrore: "6.1", transitScore: "7.2", popularity: "75", image: "Property2", rent: "$800")
        let address3 = Property(addressLine: "454 West 54th Ave", city: "Calgary, Alberta", desc: "This downtown property offers everything you could ask for within walking distance or a short drive away.", walkScrore: "6.1", transitScore: "5.2", popularity: "82", image: "Property3", rent: "$850")
        address.append(contentsOf: [address1, address2, address3])
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return address.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyCell", for: indexPath) as? PropertyCell {
            //cell.textLabel?.text = "New \(indexPath.row)"            
            cell.configure(property: address[indexPath.row])
            return cell
        } else {
            fatalError("Cannot convert to PropertyCell")
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }


}

