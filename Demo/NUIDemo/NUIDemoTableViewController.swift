//
//  NUIDemoTableViewController.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/10/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUIDemoTableViewController: UITableViewController {

    // MARK: - Table view data source
    
    var demoItems = [
        ["name" : "John",   "description" : "Guitar"],
        ["name" : "Paul",   "description" : "Bass"  ],
        ["name" : "George", "description" : "Guitar"],
        ["name" : "Ringo",  "description" : "Drums" ]
    ]
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NUIDemoCell", for: indexPath)
        
        let item = demoItems[indexPath.row]
        
        cell.textLabel?.text = item["name"]
        cell.detailTextLabel?.text = item["description"]
        
        return cell
    }
}
