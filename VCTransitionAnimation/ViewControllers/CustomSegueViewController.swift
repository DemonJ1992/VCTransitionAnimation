//
//  CustomSegueViewController.swift
//  VCTransitionAnimation
//
//  Created by renren on 15/9/16.
//  Copyright © 2015年 du. All rights reserved.
//

import UIKit

class CustomSegueViewController: UIViewController {
    
    var panGestureStartPosition : CGPoint?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    @IBAction func swipeAction(sender: UISwipeGestureRecognizer) {
        self.performSegueWithIdentifier("customSegueUnwind", sender: self)
    }
    
    @IBAction func dismissButtonAction(sender: UIButton) {
        self.performSegueWithIdentifier("customSegueUnwind", sender: self)
    }
    
}
