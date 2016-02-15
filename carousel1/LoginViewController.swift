//
//  LoginViewController.swift
//  carousel1
//
//  Created by Madelyn Lee on 2/13/16.
//  Copyright © 2016 Madelyn Lee. All rights reserved.
//

import UIKit



class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordField: UITextField!

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var loginNavBar: UIImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    
    
    
    
    
    
    var initialY: CGFloat!
    var offset: CGFloat!
    
    var initialButtonY: CGFloat!
    var buttonOffset: CGFloat!
    


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        
        initialY = fieldParentView.frame.origin.y
        offset = -90
        
        initialButtonY = buttonParentView.frame.origin.y
        buttonOffset = -220
 

        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)


        
        // Do any additional setup after loading the view.
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
    
    
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    
    func keyboardWillShow (notifications: NSNotification!) {
        fieldParentView.frame.origin.y = initialY + offset
        
        buttonParentView.frame.origin.y = initialButtonY + buttonOffset

    }
    
    
    
    func keyboardWillHide (notifications: NSNotification!) {
        fieldParentView.frame.origin.y = initialY
        buttonParentView.frame.origin.y = initialButtonY

        
    }
    
    override func viewWillAppear(animated: Bool) {
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        // Apply the transform properties of the views
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        // Set the alpha properties of the views to transparent
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
    }


    override func viewDidAppear(animated: Bool) {
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    
    
    
    
    
    
    

    @IBAction func onButton(sender: AnyObject) {
        self.loadingIndicator.startAnimating()
    }
    
    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func didPressLogin(sender: AnyObject) {
        loadingIndicator.startAnimating()
        loginButton.selected = true
        
        
        if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            
            
            delay(2, closure: { () -> () in
                self.loadingIndicator.stopAnimating()
                self.loginButton.selected = false
                
                
                let alertController = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .Alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                }
                
                alertController.addAction(OKAction)
                
                self.presentViewController(alertController, animated: true, completion: nil)
            })

            
            
        }
        
        
        if emailField.text == "mad" && passwordField.text == "pw" {
            delay(2, closure: { () -> () in
                self.loadingIndicator.stopAnimating()
                self.loginButton.selected = false
                
                self.performSegueWithIdentifier("signinSegue", sender: self)
                
                
            })
            
 
            
        } else {
            
            delay(2, closure: { () -> () in
                self.loadingIndicator.stopAnimating()
                self.loginButton.selected = false
                
                
                let alertController = UIAlertController(title: "Wrong Password", message: "Please try again", preferredStyle: .Alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                }
                
                alertController.addAction(OKAction)
                
                self.presentViewController(alertController, animated: true, completion: nil)
            })
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

//
    @IBAction func backDidTap(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)

    }
    
 
}