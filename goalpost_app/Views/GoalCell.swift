//
//  GoalCell.swift
//  goalpost_app
//
//  Created by Stephen Reyes on 8/3/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

// outlets
    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    
    func configureCell(goal: Goal){
        self.goalDescriptionLbl.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        self.goalProgressLbl.text = String(describing: goal.goalProgress)
    }
    
}
