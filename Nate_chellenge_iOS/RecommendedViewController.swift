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

        
//        let product = products[indexPath.row]
        
       // cell.productNameLabel.text = "product.name"
       // cell.productImageView.image = "product.photo"
       // cell.merchantLabel.text = product.merchant
      //  cell.priceLabel.text = product.price
        
        return cell
    }
    
   
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 1
       }

       func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
           // your cell coding
           return UITableViewCell()
       }

       func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
           // cell selected code here
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
        
   
                    
                 
    

        
   
    
    /*

    //MARK: Private functions
    private func loadSampleProducts(){
        let defaultProductPhoto = UIImage(named: "defaultProduct")
        
        guard let product1 = Product(name: "Product Name", photo: defaultProductPhoto, merchant: "Simon,Ltd", price: "315 B", url: nil, createAt: "20-10-2020", updateAt: "19-20-20", images: [
            "https://media-live.byredo.com/media/catalog/product/optimized/8/5/8529df057ba542031c76db2227539212ccfb359560579b72c48c9f95905e385f/mob_la-selection-nomade-3x12-ml_1_1.jpg"
          ]) else {
            fatalError("Unable to load product")
        }
        
        products += [product1,product1,product1,product1,product1]
    }
 */
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        CallRestProducts()
//        HttpCallProducts()
      //  testCall()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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

