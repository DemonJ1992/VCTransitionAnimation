//
//  PresentAnimator.swift
//  VCTransitionAnimation
//
//  Created by renren on 15/9/11.
//  Copyright © 2015年 du. All rights reserved.
//

import UIKit

class PresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // 设置fromview 属性
        let fromView = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!.view
        fromView.tintAdjustmentMode = UIViewTintAdjustmentMode.Dimmed
        fromView.userInteractionEnabled = false
        
        // 设置遮罩
        /*
        let dimmingView = UIView(frame: fromView.bounds)
        dimmingView.backgroundColor = UIColor.blackColor()
        dimmingView.layer.opacity = 0.0
        transitionContext.containerView()?.addSubview(dimmingView)
        */
        // 设置toview 属性
        let toView = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!.view
        toView.frame = CGRectMake(0.0,
                                  0.0,
                                  CGRectGetWidth((transitionContext.containerView()?.bounds)!) - 104,
                                  CGRectGetHeight((transitionContext.containerView()?.bounds)!) - 288)
        toView.center = CGPointMake((transitionContext.containerView()?.center.x)!, -(transitionContext.containerView()?.center.y)!)
        transitionContext.containerView()?.addSubview(toView)
        
        // 设置动画
        let positionAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        let toValue = NSNumber(float: Float((transitionContext.containerView()?.center.y)!))
        positionAnimation.toValue = toValue
        positionAnimation.springBounciness = 10.0
        positionAnimation.completionBlock = { (POPAnimation animation, Bool finish) -> () in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
        
        let scaleAnimation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnimation.springBounciness = 20.0
        scaleAnimation.fromValue = NSValue(CGPoint: CGPointMake(1.2, 1.4))
        scaleAnimation.toValue = NSValue(CGPoint: CGPointMake(1.0, 1.0))
        
//        let opacityAnimation = POPBasicAnimation(propertyNamed: kPOPLayerOpacity)
//        opacityAnimation.toValue = NSNumber(float: 0.2)
//        opacityAnimation.completionBlock = { (POPAnimation animation, Bool finish) -> () in
//            dimmingView.layer.opacity = 0.2
//        }
        
        toView.layer.pop_addAnimation(positionAnimation, forKey: "positionAnimationKey")
        toView.layer.pop_addAnimation(scaleAnimation, forKey: "scaleAnimationKey")
        //dimmingView.layer.pop_addAnimation(opacityAnimation, forKey: "opacityAnimationKey")
    }
    
    func animationEnded(transitionCompleted: Bool) {
        
    }
}
