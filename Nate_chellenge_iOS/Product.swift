//
//  Product.swift
//  Nate_chellenge_iOS
//
//  Created by Kantachat Puagkajee on 07/11/2020.
//

import UIKit

class Product {
    
    //MARK: Properties
    var name: String
    var photo: UIImage?
    var merchant: String
    var price: String
    var url: String?
    var createAt: String?
    var updateAt: String?
    
    init?(name: String, photo: UIImage?, merchant: String, price: String, url: String?, createAt: String, updateAt: String){
        
        self.name = name
        self.photo = photo
        self.merchant = merchant
        self.price = price
        self.url = url
        self.createAt = createAt
        self.updateAt = updateAt
        
    }
}
