//
//  ViewController.swift
//  ExerciseTwo
//
//  Created by bopeng on 16/6/29.
//  Copyright © 2016年 Scott. All rights reserved.
//

import UIKit



class ViewController: UIViewController{
    
    // MARK:点击显示
    @IBAction func showBtnClick() {
        let scottVC = ScottViewController()
        
//        scottVC.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
        scottVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        scottVC.transitioningDelegate = self
        presentViewController(scottVC, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    private lazy var scottPresentAnimation = AnimationPresentProxy()
    private lazy var scottDismissAnimation = AnimationDismissProxy()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController:UIViewControllerTransitioningDelegate {
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return scottPresentAnimation
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return scottDismissAnimation
    }
}

