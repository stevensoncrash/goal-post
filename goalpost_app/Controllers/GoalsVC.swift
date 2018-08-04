//
//  GoalsVC.swift
//  goalpost_app
//
//  Created by Stephen Reyes on 8/1/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController {
    
      @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    @IBAction func addGoalBtnWasPressed(_ sender: Any) {
        
        print("button was pressed")
    }
    
}

