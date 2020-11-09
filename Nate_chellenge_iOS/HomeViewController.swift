//
//  ViewController.swift
//  Nate_chellenge_iOS
//
//  Created by Kantachat Puagkajee on 06/11/2020.
//

import UIKit

class HomeViewController: UIViewController, UISearchBarDelegate {
    //MARK: Properties
    @IBOutlet weak var recommendedView: UIView!
    @IBOutlet weak var OfficialView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var UISearchBar: UISearchBar!
    
 
    //MARK: Actions
    @IBAction func SegmentController(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            recommendedView.alpha = 1
            OfficialView.alpha = 0
           
        } else {
            recommendedView.alpha = 0
            OfficialView.alpha = 1
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        performSegue(withIdentifier: "searchSegue", sender: self)
        UISearchBar.resignFirstResponder()
    }
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        performSegue(withIdentifier: "searchSegue", sender: self)
        UISearchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        performSegue(withIdentifier: "searchSegue", sender: self)
        UISearchBar.resignFirstResponder()
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        UISearchBar.resignFirstResponder()
    }
    
    @IBAction func expandButton(_ sender: Any) {
         performSegue(withIdentifier: "searchSegue", sender: self)
    }
    @IBOutlet weak var PageImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.UISearchBar.delegate = self
       
       
      
    }


}

