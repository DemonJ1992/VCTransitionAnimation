//
//  PopAnimator.swift
//  VCTransitionAnimation
//
//  Created by renren on 15/9/11.
//  Copyright © 2015年 du. All rights reserved.
//

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.7
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let fromView = fromVC!.view
        let toView = toVC!.view
        toView.alpha = 0.0
        transitionContext.containerView()?.addSubview(toView)
        fromView.layer.masksToBounds = true
        fromView.layer.cornerRadius = 30.0
        
        UIView.animateWithDuration(0.7, animations: { () -> Void in
            var transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
            transform = CGAffineTransformTranslate(transform, CGRectGetWidth(toView.bounds)/2.0, -CGRectGetHeight(toView.bounds)/2.0)
            transform = CGAffineTransformScale(transform, 0.2, 0.2)
            fromView.transform = transform
            toView.alpha = 1.0
        }) { (Bool finish) -> Void in
            toView.alpha = 1.0
            fromView.transform = CGAffineTransformIdentity
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
    
    func animationEnded(transitionCompleted: Bool) {
        
    }
}
