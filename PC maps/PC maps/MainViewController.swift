//
//  MainViewController.swift
//  PC maps
//
//  Created by Arthur Bandeira on 17/05/17.
//  Copyright © 2017 Arthur Bandeira. All rights reserved.
//

import UIKit
import SVProgressHUD


class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated : Bool) {
        super.viewWillDisappear(animated)
        SVProgressHUD.show(withStatus: "Carregando")
    }
    
    @IBAction func showUsers(_ sender: Any) {
        
        performSegue(withIdentifier: "show", sender: self)
        
    }
    
   
}
