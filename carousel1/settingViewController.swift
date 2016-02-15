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
    
    
    
//    
//    
//    @IBAction func didPressSignout (sender: AnyObject) {
// 
//                let alertController = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .Alert)
//                
//                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
//                }
//                
//                alertController.addAction(OKAction)
//                
//                self.presentViewController(alertController, animated: true, completion: nil)
//        
//        }


    
    
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backDidTap(sender: AnyObject) {
        

        let alertController = UIAlertController(title: "", message: "Are you sure you want to sign out?", preferredStyle: .ActionSheet)
        
        let logoutAction = UIAlertAction(title: "Sign Out", style: .Destructive) { (action) in
            
              self.performSegueWithIdentifier("signoutSegue", sender: self)
            
            
//             self.dismissViewControllerAnimated(true, completion: nil)
            
            // handle case of user logging out
        }
        // add the logout action to the alert controller
        alertController.addAction(logoutAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // handle case of user canceling. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alert controller
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }

        
//        dismissViewControllerAnimated(true, completion: nil)
    }
}
