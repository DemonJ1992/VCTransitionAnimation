//
//  PushAnimator.swift
//  VCTransitionAnimation
//
//  Created by renren on 15/9/11.
//  Copyright © 2015年 du. All rights reserved.
//

import UIKit

class PushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let animationFinishCallBack : () -> ()
    
    init(animationFinishCallBack : () -> ()) {
        self.animationFinishCallBack = animationFinishCallBack
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let viewWidth = fromVC!.view.bounds.size.width
        let viewHeight = fromVC!.view.bounds.size.height
        //toVC?.view.layer.opacity = 0.0
        toVC!.view.frame = CGRectMake(0.0, 0.0, viewWidth, viewHeight)
        toVC?.view.userInteractionEnabled = false
        transitionContext.containerView()?.addSubview((toVC?.view)!)
        
        let toVCScaleAnimation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        toVCScaleAnimation.springBounciness = 20.0
        toVCScaleAnimation.fromValue = NSValue(CGPoint: CGPointMake(3.0, 3.0))
        toVCScaleAnimation.toValue = NSValue(CGPoint: CGPointMake(1.0, 1.0))
        toVCScaleAnimation.completionBlock = { (POPAnimation animation, Bool finish) -> () in
            toVC?.view.layer.opacity = 1.0
            toVC?.view.userInteractionEnabled = true
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
        
        let toVCOpacityAnimation = POPBasicAnimation(propertyNamed: kPOPLayerOpacity)
        toVCOpacityAnimation.toValue = NSNumber(float: 1.0)
        toVCOpacityAnimation.duration = 0.25

        
        toVC?.view.layer.pop_addAnimation(toVCOpacityAnimation, forKey: "toVCOpacityAniamtionKey")
        toVC?.view.layer.pop_addAnimation(toVCScaleAnimation, forKey: "toVCScaleAnimationKey")
    }
    
    func animationEnded(transitionCompleted: Bool) {
        if transitionCompleted {
            self.animationFinishCallBack()
        }
    }
}
