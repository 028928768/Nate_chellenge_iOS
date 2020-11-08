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
        let defaultProductPhoto = UIImage(named: "defaultProduct")
        
        
        guard let merchant1 = Merchant(no: "1.", photo: defaultProductPhoto, merchant: "Apple, Ltd", rating: "rating: 5") else {
            fatalError("Unable to load merchants")
        }
     
        
        merchants += [merchant1,merchant1,merchant1,merchant1,merchant1]
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
