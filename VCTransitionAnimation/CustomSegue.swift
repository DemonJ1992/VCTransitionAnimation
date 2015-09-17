//
//  CustomSegue.swift
//  VCTransitionAnimation
//
//  Created by renren on 15/9/16.
//  Copyright © 2015年 du. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    override func perform() {
        let fromView = (UIApplication.sharedApplication().keyWindow?.rootViewController?.view)!
        let toView = destinationViewController.view
        let window = UIApplication.sharedApplication().keyWindow
        window?.addSubview(toView)
        toView.frame = CGRectMake(0.0, CGRectGetMaxY(fromView.bounds), CGRectGetWidth(fromView.bounds), CGRectGetHeight(fromView.bounds))
        UIView.animateWithDuration(0.6, animations: { () -> Void in
            fromView.transform = CGAffineTransformScale(fromView.transform, 0.5, 0.5)
            toView.frame = CGRectMake(0.0, 0.0, CGRectGetWidth(fromView.bounds), CGRectGetHeight(fromView.bounds))
            }) { (Bool finish) -> Void in
                fromView.transform = CGAffineTransformIdentity
                self.sourceViewController.presentViewController(self.destinationViewController, animated: false, completion: nil)
        }
    }
}
