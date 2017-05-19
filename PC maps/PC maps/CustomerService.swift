//
//  CustomerService.swift
//  PC maps
//
//  Created by Arthur Bandeira on 16/05/17.
//  Copyright © 2017 Arthur Bandeira. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol getCustomers{
    func success()
    func failure()
    func postSuccess()
    func postFailure()
}

class CustomerService {
   
    var delegate : getCustomers?
    
    init(delegate : getCustomers) {
        self.delegate = delegate
    }
    
    func getCustomers(){
        
        let url = "http://localhost:3000/customers.json"
        
        Alamofire.request(url, method: .get).validate().responseArray { (response : DataResponse<[Customer]>) in
            
            if response.result.isSuccess {
                
                if let customerResponse = response.result.value{
                    try! realm.write {
                        realm.deleteAll()
                    }
                    for customer in customerResponse {
                        
                        try! realm.write {
                                realm.add(customer, update : true)
                        }
                    }
                }
                
                self.delegate?.success()
            } else {
                
                self.delegate?.failure()
            }
        }
    }
    
    func postCustomer(customer : Customer){
        let url = "http://localhost:3000/customers.json"
        let params : [String : Any] = ["name": customer.name!, "email": customer.email!, "birthday": customer.birthday!, "obs": customer.observation!]
        
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseObject { (response :DataResponse<Customer>) in
            
            if response.result.isSuccess {
                
                if let responseCustomer = response.result.value {
                    try! realm.write {
                        realm.add(responseCustomer)
                    }
                    self.delegate?.postSuccess()
                } else {
                    self.delegate?.failure()
                }
                
            } else {
                
                self.delegate?.failure()
            }
        }
    }
}
