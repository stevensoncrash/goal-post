//
//  FinishGoalsVC.swift
//  goalpost_app
//
//  Created by Stephen Reyes on 8/7/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalsVC: UIViewController, UITextFieldDelegate {
    
    //outlets
    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    //vars
    var goalDescription: String!
    var goalType: GoalType!
    
    
    
    func initData(description: String, type: GoalType){
        self.goalDescription = description
        self.goalType = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyBoard()
        pointsTextField.delegate = self
        
      

    }
    //actions
    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        if pointsTextField.text != " " {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
            }
        }
    }
}
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelgate?.persistentContainer.viewContext else {return}
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
        try managedContext.save()
            print("Successfully Saved Data!")
            completion(true)
        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
   }
}
    
    
    
    
    
    
    
    
    

