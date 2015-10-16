//
//  TabBarControllerDelegate.swift
//  VCTransitionAnimation
//
//  Created by renren on 15/9/15.
//  Copyright © 2015年 du. All rights reserved.
//

import UIKit

class TabBarControllerDelegate: NSObject, UITabBarControllerDelegate {
    
    @IBOutlet weak var tabBarController: TabbarController!
    
    func tabBarController(tabBarController: UITabBarController, animationControllerForTransitionFromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TabAnimator(tabBarController: self.tabBarController)
    }
}
