//
//  MainTableViewController.swift
//  PC maps
//
//  Created by Arthur Bandeira on 16/05/17.
//  Copyright © 2017 Arthur Bandeira. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift
import SVProgressHUD
class MainTableViewController: UITableViewController, getCustomers, finishedDelegate{
    
    var customers = [Customer]()
    
    var teste : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        try! realm.write {
            realm.deleteAll()
        }
        self.tableView.tableFooterView = UIView(frame: .zero)
        
        CustomerService.init(delegate: self).getCustomers()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        CustomerService.init(delegate: self).getCustomers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return customers.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "addModal", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! MainTableViewCell
        
            cell.bind(customer: customers[indexPath.row])
            return cell
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "addModal") {
            let destination = segue.destination as! AddViewController
            destination.delegate = self
        }
    }
    func success() {
        SVProgressHUD.dismiss()
        let custom = realm.objects(Customer.self)
        self.customers.removeAll()
        
        for item in custom {
            
            self.customers.append(item)
        }
        self.tableView.reloadData()
    }
    func failure() {
        
    }
    
    func postSuccess() {
        
    }
    func postFailure() {
        
    }
    
    func dismissModal() {
        
        SVProgressHUD.dismiss()
        
        let custom = realm.objects(Customer.self)
        
        self.customers.removeAll()
        
        for item in custom {
            
            self.customers.append(item)
        }
        self.tableView.reloadData()
    }
}
