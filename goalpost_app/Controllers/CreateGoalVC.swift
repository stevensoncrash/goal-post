//
//  CreateGoalVC.swift
//  goalpost_app
//
//  Created by Stephen Reyes on 8/7/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {
    
//outlets
    
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyBoard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeSelectedColor()
    }
    
//actions
    @IBAction func shortTermBtnWasPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeSelectedColor()
    }
    
    @IBAction func longTermBtnWasPressed(_ sender: Any) {
        goalType = .longTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeSelectedColor()
    }
    
    @IBAction func nextBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
}




