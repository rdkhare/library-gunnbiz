//
//  ProfileSetup.swift
//  FBLAMobileApplicationLibrary
//
//  Created by Rajat Khare on 11/1/17.
//  Copyright © 2017 RDKhare. All rights reserved.
//

import Foundation
import UIKit
import GoogleSignIn

class Account: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        GIDSignIn.sharedInstance().uiDelegate = self
        
        if(GIDSignIn.sharedInstance().hasAuthInKeychain()) {
            
            let user = GIDSignIn.sharedInstance().currentUser
            
            let name = user?.profile.name
            let imageURL = user?.profile.imageURL(withDimension: 125)
            
            downloadImage(url: imageURL!)
            nameLabel.text = name
        }
        
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                self.profileImage.image = UIImage(data: data)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    @IBAction func signOut(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
    }
}
