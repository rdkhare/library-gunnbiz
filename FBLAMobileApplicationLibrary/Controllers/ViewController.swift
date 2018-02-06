//
//  ViewController.swift
//  FBLAMobileApplicationLibrary
//
//  Created by Rajat Khare on 10/31/17.
//  Copyright © 2017 RDKhare. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase

class ViewController: UIViewController, GIDSignInUIDelegate{

    @IBOutlet weak var signInButton: GIDSignInButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        signInButton.style = .wide
        GIDSignIn.sharedInstance().uiDelegate = self
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

