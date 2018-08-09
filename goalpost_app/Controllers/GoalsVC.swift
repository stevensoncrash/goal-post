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
    
    var goals: [Goal] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false 
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        fetchCoreDataObjects()
        tableView.reloadData()
    }
    
    func fetchCoreDataObjects() {
        self.fetch { (complete) in
            if complete {
                if goals.count >= 1 {
                    tableView.isHidden = false
                } else {
                    tableView.isHidden = true
                }
            }
        }
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
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {
            return UITableViewCell() }
        let goal = goals[indexPath.row]
        cell.configureCell(goal: goal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            tableView.beginUpdates()
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
    }
        
        let addAction = UITableViewRowAction(style: .normal, title: "ADD 1") { (rowAction, indexPath) in
            self.setProgress(atIndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
            
        }
        deleteAction.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        addAction.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        
        return [deleteAction,addAction]
 }
}


extension GoalsVC {
    func setProgress(atIndexPath indexPath: IndexPath) {
          guard let managedContext = appDelgate?.persistentContainer.viewContext else {return}
        
          let chosenGoal = goals[indexPath.row]
        
        if chosenGoal.goalProgress < chosenGoal.goalCompletionValue {
            chosenGoal.goalProgress = chosenGoal.goalProgress + 1
        } else {
            return
        }
        do {
            try managedContext.save()
            debugPrint("Progress set!")
        } catch {
            debugPrint("Could not set progress:\(error.localizedDescription)")
        }
    }
    
    
    func removeGoal(atIndexPath indexPath: IndexPath) {
        guard let managedContext = appDelgate?.persistentContainer.viewContext else {return}
        managedContext.delete(goals[indexPath.row])
        
        do {
            try managedContext.save()
            print("Goal removed!")
        } catch {
            debugPrint("Could not remove:\(error.localizedDescription)")
        }
        
        
    }
    func fetch(comepletion:(_ complete: Bool)-> ()) {
        guard let managedContext = appDelgate?.persistentContainer.viewContext else {return}
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            goals = try managedContext.fetch(fetchRequest)
            comepletion(true)
            print("Data fetched")
        } catch {
            debugPrint("Could not fetch: \(error.localizedDescription)")
            comepletion(false)
        }
        tableView.reloadData()
    }
}

















