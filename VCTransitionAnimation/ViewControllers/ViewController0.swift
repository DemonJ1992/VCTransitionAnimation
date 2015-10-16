//
//  ViewController0.swift
//  VCTransitionAnimation
//
//  Created by renren on 15/9/11.
//  Copyright © 2015年 du. All rights reserved.
//

import UIKit

class ViewController0: UIViewController {
    
    let transitionDelegate = PresentDelegate()

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
        if ("presentSegue" == segue.identifier) {
            print("haha")
            segue.destinationViewController.transitioningDelegate = transitionDelegate
            segue.destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        }
    }
}
