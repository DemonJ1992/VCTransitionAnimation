//
//  ViewController1.swift
//  VCTransitionAnimation
//
//  Created by renren on 15/9/11.
//  Copyright © 2015年 du. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
    
    var navigationDelegate : NavigationDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationDelegate = NavigationDelegate(navigationController: self.navigationController!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if "pushSegue" == segue.identifier {
            self.navigationController?.delegate = self.navigationDelegate
        }
    }

}
