//
//  storyboardViewController.swift
//  carousel1
//
//  Created by Madelyn Lee on 2/13/16.
//  Copyright © 2016 Madelyn Lee. All rights reserved.
//

import UIKit

class storyboardViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var backupButtonImage: UIImageView!
    @IBOutlet weak var backupSwitch: UISwitch!
    @IBOutlet weak var proceedButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self

        scrollView.contentSize = CGSize(width: 1280, height: 568)
        scrollView.frame.size = CGSize(width: 320, height: 568)
//        buttonView.alpha = 1
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        if page == 3 {
            pageControl.hidden = true
     }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
