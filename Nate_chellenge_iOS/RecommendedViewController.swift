//
//  RecommendedViewController.swift
//  Nate_chellenge_iOS
//
//  Created by Kantachat Puagkajee on 07/11/2020.
//

import UIKit

class RecommendedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Properties
    var products = [Product]()
    
    //MARK: TableViewController delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cellIdentifier = "ProductTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ProductTableViewCell else {
            fatalError("The dequeued cell is not an instance of ProductTableViewCell")
        }
        
        
        let product = products[indexPath.row]
        
        cell.productNameLabel.text = product.name
        cell.productImageView.image = product.photo
        cell.merchantLabel.text = product.merchant
        cell.priceLabel.text = product.price
        
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
    
    
    
    

    //MARK: Private functions
    private func loadSampleProducts(){
        let defaultProductPhoto = UIImage(named: "defaultProduct")
        
        guard let product1 = Product(name: "Product Name", photo: defaultProductPhoto, merchant: "Simon,Ltd", price: "315 B", url: nil, createAt: "20-10-2020", updateAt: "19-20-20") else {
            fatalError("Enable to load product")
        }
        
        products += [product1,product1,product1,product1,product1]
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        loadSampleProducts()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
