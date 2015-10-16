//
//  PushViewController.swift
//  VCTransitionAnimation
//
//  Created by renren on 15/9/11.
//  Copyright © 2015年 du. All rights reserved.
//

import UIKit

class PushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        let navigationTitle = "PushVC\((self.navigationController?.viewControllers.count)! - 1)"
        self.navigationItem.title = navigationTitle
        // Do any additional setup after loading the view.
        let colorArray = [0xFAEBB9, 0xC6F0B9, 0xC6F0FF, 0xF0F0FF, 0xFCC7DC, 0xFDFFDC, 0xB4B1DC]
        let randomNumber = random() % 7
        let color = colorArray[randomNumber]
        self.view.backgroundColor = UIColor(red: ((CGFloat)((color & 0xFF0000) >> 16))/255.0,
                                          green: ((CGFloat)((color & 0x00FF00) >> 8))/255.0,
                                           blue: ((CGFloat)(color & 0x0000FF))/255.0,
                                          alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func popButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
