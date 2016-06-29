//
//  AnimationDismissProxy.swift
//  ExerciseTwo
//
//  Created by bopeng on 16/6/29.
//  Copyright © 2016年 Scott. All rights reserved.
//

import UIKit

class AnimationDismissProxy: NSObject,UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // 1.获取containerView
//        let containerView = transitionContext.containerView()
        
        // 2.获取fromView
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        
        // 3.动画
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { 
            if fromView?.transform.b > 0{
                fromView?.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
            }else{
                fromView?.transform = CGAffineTransformMakeRotation(-CGFloat(M_PI_2))
            }
            }) { (_) in
                transitionContext.completeTransition(true)
        }
    }
}
