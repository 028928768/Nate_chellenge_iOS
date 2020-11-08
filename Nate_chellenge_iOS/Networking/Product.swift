//
//  Product.swift
//  Nate_chellenge_iOS
//
//  Created by Kantachat Puagkajee on 07/11/2020.
//

import UIKit

struct Product: Decodable {
  let id: String
  let createdAt: String
  let updatedAt: String
  let title: String
  let images: [String]
  let url: String
  let merchant: String
  
  enum CodingKeys: String, CodingKey {
    case id
    case createdAt
    case updatedAt
    case title
    case images
    case url
    case merchant 
  }
}

extension Product: Displayable {
    var imagesUrl: [String] {
        images
    }
    
    var titleLabel: String {
        title
    }
    
    var idLabel: String {
        id
    }
    
    var merchantLabel: String {
        merchant
    }
    
    
    var urlLabel: String {
        url
    }
    
    var createdLabel: String {
        createdAt
    }
    
    var updatedLabel: String {
        updatedAt
    }
    
 
    
    
 
}






/*

class Product {
    
    //MARK: Properties
  /*  var id: String
    var name: String
    var photo: UIImage?
    var merchant: String
    var price: String
    var url: String?
    var createAt: String?
    var updateAt: String?
    var images: [String?]
    */
  
    /*
     
     */
    var id: String
    var createdAt: String
    var updateAt: String
    var title: String
    var images: [String?]
    var url: String
    var merchant: String
    var price: String
    
  
    
    init?(dictionary : [String : AnyObject]) {
      id = dictionary["id"] as? String ?? ""
      createdAt = dictionary["createAt"] as? String ?? ""
      updateAt = dictionary["updateAt"] as? String ?? ""
      title = dictionary["title"] as? String ?? ""
      images = dictionary["images"] as? [String] ?? [""]
      url = dictionary["url"] as? String ?? ""
      merchant = dictionary["merchant"] as? String ?? ""
      price = dictionary["price"] as? String ?? "Price"
        
        

    }
}

 */
