//
//  BookTableView.swift
//  FBLAMobileApplicationLibrary
//
//  Created by Taruna Arora on 12/5/17.
//  Copyright © 2017 RDKhare. All rights reserved.
//

import Foundation
import UIKit

class BookTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let bookCellID = "bookCellID"
    
    @IBOutlet weak var bookTableView: UITableView!
    override func viewDidLoad() {
        self.bookTableView.delegate = self
        self.bookTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: bookCellID, for: indexPath) as! bookCell
        
        cell.bookTitle.text = "Harry Potter"
        cell.bookAuthor.text = "J.K Rowling"
        
        cell.bookTitle.textColor = UIColor.black
        cell.bookAuthor.textColor = UIColor.black
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
}
