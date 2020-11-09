//
//  DetailViewController.swift
//  Nate_chellenge_iOS
//
//  Created by Kantachat Puagkajee on 08/11/2020.
//

import UIKit

class DetailViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var merchantLabel: UILabel!
    @IBOutlet weak var urlLabel: UITextView!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!

    @IBOutlet weak var priceLabel: UILabel!
    
    //MARK: selectedProduct from previous page
    var data: Displayable?
  
    
    
    //MARK: selected Data initilise
    private func initProductDetails() {
        guard let data = data else { return }
        titleLabel.text = data.titleLabel
        idLabel.text = data.idLabel
        merchantLabel.text = data.merchantLabel
        urlLabel.text = data.urlLabel
        createdLabel.text = data.createdLabel
        updatedLabel.text = data.updatedLabel
        //set product image
        let url = URL(string: data.imagesUrl[0])
        productImageView?.kf.setImage(with: url)
       
          
    
        
    }
    
    //MARK: UnwindSegue
    @IBAction func unWindSegue(_ sender: UIStoryboard) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
      //  print(data?.titleLabel)
        initProductDetails()
  
     
          
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
