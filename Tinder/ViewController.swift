//
//  ViewController.swift
//  Storing Images
//
//  Created by Rob Percival on 12/08/2014.
//  Copyright (c) 2014 Appfish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var loginCancelledLabel: UILabel!
    
    var fbloginView:FBLoginView = FBLoginView(readPermissions: ["email", "public_profile"])
    
    @IBAction func signIn(sender: AnyObject) {
        
        var permissions = ["public_profile"]
        
        self.loginCancelledLabel.alpha = 0
        
        
        PFFacebookUtils.logInWithPermissions(permissions, {
            (user: PFUser!, error: NSError!) -> Void in
            if user == nil {
                NSLog("Uh oh. The user cancelled the Facebook login.")
                
                self.loginCancelledLabel.alpha = 1
                
            } else if user.isNew {
                NSLog("User signed up and logged in through Facebook!")
                
                self.performSegueWithIdentifier("signUp", sender: self)
                
            } else {
                NSLog("User logged in through Facebook!")
                
                
            }
            
        })
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if PFUser.currentUser() != nil {
            
            println("User logged in")
            
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

