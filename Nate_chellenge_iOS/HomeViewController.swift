//
//  ViewController.swift
//  Nate_chellenge_iOS
//
//  Created by Kantachat Puagkajee on 06/11/2020.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var recommendedView: UIView!
    @IBOutlet weak var OfficialView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
 
    //MARK: Actions
    @IBAction func SegmentController(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            recommendedView.alpha = 1
            OfficialView.alpha = 0
           // performSegue(withIdentifier: "feedSegue", sender: self)
        } else {
            recommendedView.alpha = 0
            OfficialView.alpha = 1
        }
        
    }
    
    @IBOutlet weak var PageImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
       
      
    }


}

