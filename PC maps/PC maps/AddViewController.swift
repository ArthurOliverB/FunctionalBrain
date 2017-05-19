//
//  AddViewController.swift
//  PC maps
//
//  Created by Arthur Bandeira on 18/05/17.
//  Copyright © 2017 Arthur Bandeira. All rights reserved.
//

import UIKit

protocol finishedDelegate {
    func dismissModal()
}

class AddViewController: UIViewController, getCustomers {
    
    var delegate : finishedDelegate?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var ObsTextField: UITextField!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentView.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addNewCustomer(_ sender: Any) {
        if let name = self.nameTextField.text {
            if let email = self.emailTextField.text {
                if let ob = self.ObsTextField.text {
                    var customer = Customer()
                    customer.name = name
                    customer.email = email
                    customer.observation = ob
                    customer.birthday = "2012-01-21"
                    CustomerService.init(delegate: self).postCustomer(customer: customer)
                }
            }
        }
    }
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func success() {
        
    }
    func postSuccess() {
        self.delegate?.dismissModal()
        self.dismiss(animated: true, completion: nil)
    }
    func failure() {
        
    }
    func postFailure() {
        
    }

}
