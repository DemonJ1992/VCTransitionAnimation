//
//  CustomSegueViewController.swift
//  VCTransitionAnimation
//
//  Created by renren on 15/9/16.
//  Copyright © 2015年 du. All rights reserved.
//

import UIKit

typealias testBlock = () -> Void

class CustomSegueViewController: UIViewController {
    
    var panGestureStartPosition : CGPoint?
    
    var test : testBlock?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.test = {
            [unowned self] in
            self.testMethod()
        }
        if let block = self.test {
            block()
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func testMethod() {
        print("test method")
    }

    @IBAction func swipeAction(sender: UISwipeGestureRecognizer) {
        self.performSegueWithIdentifier("customSegueUnwind", sender: self)
    }
    
    @IBAction func dismissButtonAction(sender: UIButton) {
        self.performSegueWithIdentifier("customSegueUnwind", sender: self)
    }
    
    deinit {
        print("customSegueViewController dead")
    }
    
}
