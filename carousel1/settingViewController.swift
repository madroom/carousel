//
//  settingViewController.swift
//  carousel1
//
//  Created by Madelyn Lee on 2/14/16.
//  Copyright © 2016 Madelyn Lee. All rights reserved.
//

import UIKit

class settingViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 320, height: 695)
        
        scrollView.frame.size = CGSize(width: 320, height: 504)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backDidTap(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
