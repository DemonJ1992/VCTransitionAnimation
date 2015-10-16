//
//  TabAnimator.swift
//  VCTransitionAnimation
//
//  Created by renren on 15/9/14.
//  Copyright © 2015年 du. All rights reserved.
//

import UIKit

class TabAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let tabBarController : TabbarController
    
    init(tabBarController : TabbarController) {
        self.tabBarController = tabBarController
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let fromView = fromVC!.view
        let toView = toVC!.view
        
        let fromIndex = tabBarController.viewControllers?.indexOf(fromVC!)
        let toIndex = tabBarController.viewControllers?.indexOf(toVC!)
        
        if toIndex > fromIndex {
            toView.frame = CGRectMake(CGRectGetMaxX(fromView.bounds), 0.0, CGRectGetWidth(fromView.bounds), CGRectGetHeight(fromView.bounds))
            transitionContext.containerView()?.addSubview(toView)
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                toView.frame = CGRectMake(0.0, 0.0, CGRectGetWidth(fromView.bounds), CGRectGetHeight(fromView.bounds))
                fromView.frame = CGRectMake(-CGRectGetMaxX(fromView.bounds), 0.0, CGRectGetWidth(fromView.bounds), CGRectGetHeight(fromView.bounds))
            }, completion: { (Bool finish) -> Void in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            })
        } else {
            toView.frame = CGRectMake(-CGRectGetMaxX(fromView.bounds), 0.0, CGRectGetWidth(fromView.bounds), CGRectGetHeight(fromView.bounds))
            transitionContext.containerView()?.addSubview(toView)
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                toView.frame = CGRectMake(0.0, 0.0, CGRectGetWidth(fromView.bounds), CGRectGetHeight(fromView.bounds))
                fromView.frame = CGRectMake(CGRectGetMaxX(fromView.bounds), 0.0, CGRectGetWidth(fromView.bounds), CGRectGetHeight(fromView.bounds))
            }, completion: { (Bool finish) -> Void in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            })
        }
    }
}
