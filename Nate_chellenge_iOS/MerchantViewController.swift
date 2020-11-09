//
//  MerchantViewController.swift
//  Nate_chellenge_iOS
//
//  Created by Kantachat Puagkajee on 07/11/2020.
//

import UIKit

class MerchantViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    var merchants = [Merchant]()
    
    
    //MARK: TableViewDelegate and DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return merchants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "MerchantTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MerchantTableViewCell else {
            fatalError("The dequeued cell is not an instance of MerchantTableViewCell")
        }
        
        
        let merchant = merchants[indexPath.row]
        
        cell.NoLabel.text = merchant.no
        cell.merchantLabel.text = merchant.merchant
        cell.merchantImageView.image = merchant.photo
        cell.ratingLabel.text = merchant.rating
        
        
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
    private func loadSampleMerchants(){
        let merchant_logo1 = UIImage(named: "nate-Logo")
        let merchant_logo2 = UIImage(named: "apple-Logo")
        let merchant_logo3 = UIImage(named: "ikea-Logo")
        let merchant_logo4 = UIImage(named: "ms-Logo")
        let merchant_logo5 = UIImage(named: "nvidia-Logo")
        let merchant_logo6 = UIImage(named: "sony-Logo")
        let merchant_logo7 = UIImage(named: "trainLine-Logo")
        let merchant_logo8 = UIImage(named: "barclays-Logo")
        
        //bruteforce initialise merchants data
        guard let merchant1 = Merchant(no: "1.", photo: merchant_logo1, merchant: "Nate", rating: "rating: 5") else {
            fatalError("Unable to load merchants1")
        }
        
        guard let merchant2 = Merchant(no: "2.", photo: merchant_logo2, merchant: "Apple", rating: "rating: 4.8") else {
            fatalError("Unable to load merchants2")
        }
        guard let merchant3 = Merchant(no: "3.", photo: merchant_logo3, merchant: "Ikea", rating: "rating: 4.7") else {
            fatalError("Unable to load merchants3")
        }
        guard let merchant4 = Merchant(no: "4.", photo: merchant_logo4, merchant: "Mark & Spencor", rating: "rating: 4.2") else {
            fatalError("Unable to load merchants4")
        }
        guard let merchant5 = Merchant(no: "5.", photo: merchant_logo5, merchant: "Nvidia", rating: "rating: 4.0") else {
            fatalError("Unable to load merchants4")
        }
        guard let merchant6 = Merchant(no: "6.", photo: merchant_logo6, merchant: "Sony", rating: "rating: 4.1") else {
            fatalError("Unable to load merchants5")
        }
        guard let merchant7 = Merchant(no: "7.", photo: merchant_logo7, merchant: "Trainline, UK", rating: "rating: 4.2") else {
            fatalError("Unable to load merchants1")
        }
        guard let merchant8 = Merchant(no: "8.", photo: merchant_logo8, merchant: "Barclays, UK", rating: "rating: 3.9") else {
            fatalError("Unable to load merchants8")
        }
     
        
        merchants += [merchant1,merchant2,merchant3,merchant4,merchant5,merchant6,merchant7,merchant8]
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        loadSampleMerchants()
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
