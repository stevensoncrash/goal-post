//
//  FinishGoalsVC.swift
//  goalpost_app
//
//  Created by Stephen Reyes on 8/7/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit

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
        // Pass Data into Core Data Model
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
}
