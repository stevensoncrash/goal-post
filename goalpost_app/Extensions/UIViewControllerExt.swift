//
//  UIViewControllerExt.swift
//  goalpost_app
//
//  Created by Stephen Reyes on 8/7/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit


extension UIViewController {
    
    func presentDetail(_ viewControllertoPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(viewControllertoPresent, animated: false, completion: nil)
        }
    
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
}
