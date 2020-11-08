//
//  RecommendedViewController.swift
//  Nate_chellenge_iOS
//
//  Created by Kantachat Puagkajee on 07/11/2020.
//

import UIKit
import Alamofire
import SwiftyJSON

class RecommendedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    //MARK: Properties
    var items: [Displayable] = [] //products objects retreived from server
    var selectedItem: Displayable? // prepare for Segue selectedCell to detailsViewcontroller



    
    //MARK: TableViewController delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cellIdentifier = "ProductTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ProductTableViewCell else {
            fatalError("The dequeued cell is not an instance of ProductTableViewCell")
        }
        
        
        let item = items[indexPath.row]
        cell.productNameLabel.text = item.titleLabel
     //   cell.productImageView.image = item.imagesUrl ----> download image from url and store into each cell!
        cell.merchantLabel.text = item.merchantLabel
        cell.priceLabel.text = "£"
        
        return cell
    }
    
   
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 1
       }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
      selectedItem = items[indexPath.row]
      return indexPath
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // performSegue(withIdentifier: "productDetailSegue", sender: self)
    }
  

  
/*
    //MARK: REST API REQUEST GET products
    func getProductsAPICall(){
        // send request to URL
            let urlPath:String = "http://localhost:3000/"
            var url:NSURL = NSURL(string: urlPath)!
        var request1: NSMutableURLRequest = NSMutableURLRequest(url: url as URL)
        request1.httpMethod = "POST"
            var stringPost = "products"  ///key and value

           let data = stringPost.data(using: String.Encoding.utf8)
            request1.timeoutInterval = 60
            request1.httpBody = data
            request1.httpShouldHandleCookies = false


            let queue:OperationQueue = OperationQueue()
                NSURLConnection.sendAsynchronousRequest(request1 as URLRequest, queue: queue, completionHandler: {(response:URLResponse!, data:NSData!, error:NSError!) -> Void in

                //print  object response
                println("response =  \(response)")
                //print response body
                let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
                println("response data = \(responseString)")
                
                
    } */
        
   
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        CallRestProducts()
//        HttpCallProducts()
      //  testCall()
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if (segue.identifier == "productDetailSegue") {
            // pass selectedProduct to DetailProductViewController
          
            guard let destinationVC = segue.destination as? DetailViewController else {
              return
            }
            destinationVC.data = selectedItem
            destinationVC.passedString = "PASS!"
        
            
            }
       
        
    }
    

}; extension RecommendedViewController {
    
    //API CALLING usins Alamofire from localhost https
      func CallRestProducts() {
       let request = AF.request("http://localhost:3000/products", method: .post)
     //  let request = AF.request("https://swapi.dev/api/films", method: .get)
//        request.responseJSON { (data) in
//          print(data)
//        }
        
        
        //connect JSON decoder to networkings codables
        request.responseDecodable(of: Products.self) { (response) in
            guard let products = response.value else { return }
            //print(products.all[1].title)
        // retreive data from server to declared objects
            self.items = products.all
            self.tableView.reloadData()

        

        }
        
    

    }
    //===================================================================>
 
    
}

