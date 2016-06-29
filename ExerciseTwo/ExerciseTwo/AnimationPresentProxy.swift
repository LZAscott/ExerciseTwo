//
//  AnimationPresentProxy.swift
//  ExerciseTwo
//
//  Created by bopeng on 16/6/29.
//  Copyright © 2016年 Scott. All rights reserved.
//

import UIKit

class AnimationPresentProxy: NSObject,UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // 1.获取containerView
        let containerView = transitionContext.containerView()
        
        // 2.获取toView
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        
        // 3.添加到containerView
        toView?.transform = CGAffineTransformMakeRotation(-CGFloat(M_PI_2))
        containerView?.addSubview(toView!)
        
        // 4.动画
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { 
            toView?.transform = CGAffineTransformIdentity
            }) { (_) in
                transitionContext.completeTransition(true)
        }
    }
}
