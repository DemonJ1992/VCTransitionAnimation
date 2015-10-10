//
//  PresentDelegate.swift
//  VCTransitionAnimation
//
//  Created by renren on 15/10/8.
//  Copyright © 2015年 du. All rights reserved.
//

import UIKit

class PresentDelegate: NSObject, UIViewControllerTransitioningDelegate {
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAnimator()
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
}
