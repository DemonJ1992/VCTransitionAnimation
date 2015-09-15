//
//  DismissAnimator.swift
//  VCTransitionAnimation
//
//  Created by renren on 15/9/11.
//  Copyright © 2015年 du. All rights reserved.
//

import UIKit

class DismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let toView = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!.view
        toView.tintAdjustmentMode = UIViewTintAdjustmentMode.Normal
        toView.userInteractionEnabled = true
        
        /*
        UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        
        __block UIView *dimmingView;
        [transitionContext.containerView.subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
            if (view.layer.opacity < 1.f) {
            dimmingView = view;
            *stop = YES;
            }
            }];
         */
        var dimmingView = UIView()
        let subviews = NSArray(array: (transitionContext.containerView()?.subviews)!)
        for view in subviews {
            if (view.layer.opacity < 1.0) {
                dimmingView = view as! UIView
                break
            }
        }
        let opacityAnimation = POPBasicAnimation(propertyNamed: kPOPLayerOpacity)
        opacityAnimation.toValue = NSNumber(float: 0.0)
        
        let fromView = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!.view
        let positionAnimation = POPBasicAnimation(propertyNamed: kPOPLayerPositionY)
        positionAnimation.toValue = NSNumber(float: Float(-fromView.layer.position.y))
        positionAnimation.completionBlock = { (POPAnimation animation, Bool finish) -> () in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
        fromView.layer.pop_addAnimation(positionAnimation, forKey: "positionAnimationKey")
        dimmingView.layer.pop_addAnimation(opacityAnimation, forKey: "opacityAnimationKey")
    }
    
    func animationEnded(transitionCompleted: Bool) {
        
    }
}
