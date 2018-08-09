//
//  GoalsVC.swift
//  goalpost_app
//
//  Created by Stephen Reyes on 8/1/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit
import CoreData

// public constant to be accessied from anywhere for saving context. 
let appDelgate = UIApplication.shared.delegate as? AppDelegate

class GoalsVC: UIViewController {
    
@IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false 
        
    }
  
    @IBAction func addGoalBtnWasPressed(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalsVC") else {return}
        presentDetail(createGoalVC)
    }
    
}


extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {
            return UITableViewCell() }
        cell.configureCell(description: "Workout 3 times a week.", type: .shortTerm, goalProgressAmount: 2)
        return cell
    }
}
