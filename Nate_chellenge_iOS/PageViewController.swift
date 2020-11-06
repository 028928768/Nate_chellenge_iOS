//
//  CategoryPageViewController.swift
//  Nate_chellenge_iOS
//
//  Created by Kantachat Puagkajee on 06/11/2020.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    //MARK: Properties
    var pageControl = UIPageControl()
    lazy var subViewControllers:[UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController1") as! ViewController1,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController2") as! ViewController2,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController3") as! ViewController3
           
        ]
        
    }()
    
    
    //MARK: UIPageViewController Delegates and DataSource
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewControllers.firstIndex(of: viewController) ?? 0
        
        if(currentIndex <= 0){
            return nil
        }
        return subViewControllers[currentIndex-1]
        
            }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if (currentIndex >= subViewControllers.count-1){
            return nil
        }
        return subViewControllers[currentIndex + 1]
    }
    
    
    func configurePageControl() {
       // The total number of pages that are available is based on how many available colors we have.
       pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 1000,width: UIScreen.main.bounds.width,height: 50))
       self.pageControl.numberOfPages = subViewControllers.count
       self.pageControl.currentPage = 0
       self.pageControl.tintColor = UIColor.black
       self.pageControl.pageIndicatorTintColor = UIColor.white
       self.pageControl.currentPageIndicatorTintColor = UIColor.black
       self.view.addSubview(pageControl)
   }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Assign delegates of UIPageViewController
        self.delegate = self
        self.dataSource = self
        configurePageControl()
        
        //load first subViewController
        setViewControllers([subViewControllers[0]], direction: .forward, animated: true, completion: nil)
       
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
