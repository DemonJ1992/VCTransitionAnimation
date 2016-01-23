//
//  UIViewController+Tracking.swift
//  VCTransitionAnimation
//
//  Created by shuaidu on 15/12/8.
//  Copyright © 2015年 du. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    public override class func initialize() {
        struct Static {
            static var token : dispatch_once_t = 0;
        }
        dispatch_once(&Static.token) { () -> Void in
            let originalSelector = Selector("viewWillAppear:")
            let swizzledSelector = Selector("myViewWillAppear:")
            
            let originalMethod = class_getInstanceMethod(self, originalSelector)
            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
            
            let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
            
            if didAddMethod {
                class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod)
            }
        }
        
    }
    
    func myViewWillAppear(animated: Bool) {
        self.myViewWillAppear(animated)
        // self.classForKeyArchiver  -> Optional(VCTransitionAnimation.ViewController0)
        print("view will appear: \(self.classForCoder)")
    }
    
    //MARK:- 键盘抬起、消失逻辑
    func addKeyboardNotification() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector.init("keyboardWillAppear:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector.init("keyboardWillDisappear:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotification() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
    }
    
    func keyboardWillAppear(notification: NSNotification) {
        print("please override this func: \(__FUNCTION__)")
    }
    
    func keyboardWillDisappear(notification: NSNotification) {
        print("please override this func: \(__FUNCTION__)")
    }
    
    
    
}