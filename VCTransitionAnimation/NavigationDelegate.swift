//
//  NavigationDelegate.swift
//  VCTransitionAnimation
//
//  Created by renren on 15/9/14.
//  Copyright © 2015年 du. All rights reserved.
//

import UIKit

class NavigationDelegate: NSObject, UINavigationControllerDelegate {
    
    var interaction : UIPercentDrivenInteractiveTransition?
    var navigationController : UINavigationController
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
        super.init()
        let pan = UIPanGestureRecognizer(target: self, action: "handleGesture:")
        self.navigationController.view.addGestureRecognizer(pan)
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if UINavigationControllerOperation.Pop == operation {
            return PopAnimator()
        } else if UINavigationControllerOperation.Push == operation {
            return PushAnimator()
        } else {
            return nil
        }
    }
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interaction
    }
    
    func handleGesture(gesture: UIPanGestureRecognizer) {
        let view = self.navigationController.view
        let location = gesture.locationInView(view)
        let translation = gesture.translationInView(view)
        var fraction = translation.x / CGRectGetWidth(view.bounds)
        if fraction < 0 {
            fraction = 0
        }
        switch gesture.state {
        case UIGestureRecognizerState.Began:
            if (location.x < CGRectGetMidX(view.bounds) && self.navigationController.viewControllers.count > 1) {
                self.interaction = UIPercentDrivenInteractiveTransition()
                self.navigationController.popViewControllerAnimated(true)
            }
            break
        case UIGestureRecognizerState.Changed:
            self.interaction?.updateInteractiveTransition(fraction)
            break
        case UIGestureRecognizerState.Cancelled, UIGestureRecognizerState.Ended:
            if (gesture.velocityInView(view).x > 0 && UIGestureRecognizerState.Cancelled != gesture.state) {
                self.interaction?.finishInteractiveTransition()
            } else {
                self.interaction?.cancelInteractiveTransition()
            }
            self.interaction = nil
            break
        default:
            self.interaction?.cancelInteractiveTransition()
            self.interaction = nil
            break
        }
    }
    
}
