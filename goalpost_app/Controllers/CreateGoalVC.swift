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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//actions
    
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
        }
    
    @IBAction func shortTermBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func longTermBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func nextBtnWasPressed(_ sender: Any) {
    }
    
}




