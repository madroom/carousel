//
//  createViewController.swift
//  carousel1
//
//  Created by Madelyn Lee on 2/14/16.
//  Copyright © 2016 Madelyn Lee. All rights reserved.
//

import UIKit

class createViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var formParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    
    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var checkboxButton: UIButton!
    
    var initialY: CGFloat!
    var offset: CGFloat!
    
    var initialButtonY: CGFloat!
    var buttonOffset: CGFloat!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        scrollView.delegate = self
        
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        
        

        
        
        initialY = formParentView.frame.origin.y
        offset = -70
        
        initialButtonY = buttonParentView.frame.origin.y
        buttonOffset = -220
        
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= -50 {
            // Hide the keyboard
            view.endEditing(true)
        }
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
    }
    
    
    
    
    func keyboardWillShow (notifications: NSNotification!) {
        formParentView.frame.origin.y = initialY + offset
        
        buttonParentView.frame.origin.y = initialButtonY + buttonOffset
        
    }
    
    
    
    func keyboardWillHide (notifications: NSNotification!) {
        formParentView.frame.origin.y = initialY
        buttonParentView.frame.origin.y = initialButtonY
    }

    
//    
//    @IBAction func didPressCreate(sender: AnyObject) {
//        createButton.selected = true
//        
//        if firstnameField.text == "mad" && lastnameField == "lee" && emailField.text == "gmail" && passwordField.text == "pw" {
//    
//        } else {
//            
//                 let alertController = UIAlertController(title: "Wrong password", message: "Please try again", preferredStyle: .Alert)
//                
//                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
//                }
//                
//                alertController.addAction(OKAction)
//                
//                self.presentViewController(alertController, animated: true, completion: nil)
//            }
//        }
//
//

    
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backDidTap(sender: AnyObject) {
             navigationController!.popViewControllerAnimated(true)
    }

@IBAction func checkboxButton(sender: AnyObject) {
    checkboxButton.selected = !checkboxButton.selected
}

}
