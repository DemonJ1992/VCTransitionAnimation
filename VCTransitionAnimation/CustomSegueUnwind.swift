//
//  CustomSegueUnwind.swift
//  VCTransitionAnimation
//
//  Created by renren on 15/9/16.
//  Copyright © 2015年 du. All rights reserved.
//

import UIKit

class CustomSegueUnwind: UIStoryboardSegue {
    override func perform() {
        let toView = (UIApplication.sharedApplication().keyWindow?.rootViewController?.view)!
        let fromView = sourceViewController.view
        let window = UIApplication.sharedApplication().keyWindow
        toView.frame = CGRectMake(0.0, 0.0, CGRectGetWidth(fromView.bounds), CGRectGetHeight(fromView.bounds))
        window?.insertSubview(toView, atIndex: 0)
        toView.transform = CGAffineTransformMakeScale(0.5, 0.5)
        UIView.animateWithDuration(0.6, animations: { () -> Void in
            fromView.frame = CGRectMake(0.0, -CGRectGetMaxY(fromView.bounds), CGRectGetWidth(fromView.bounds), CGRectGetHeight(fromView.bounds))
            fromView.alpha = 0.0
            toView.transform = CGAffineTransformIdentity
            }) { (Bool finish) -> Void in
                self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
        }
    }
}
