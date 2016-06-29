//
//  ScottViewController.swift
//  ExerciseTwo
//
//  Created by bopeng on 16/6/29.
//  Copyright © 2016年 Scott. All rights reserved.
//

import UIKit

private let ScottDurationTime = 1.0

class ScottViewController: UIViewController {
    
    override func loadView() {
        let blueView = UIView()
        view = blueView
        view.layer.anchorPoint = CGPoint(x: 0.5, y: 2.0)
        view.frame = UIScreen.mainScreen().bounds
        view.backgroundColor = UIColor.blueColor()
        
        let panGestrue = UIPanGestureRecognizer(target: self, action: #selector(self.panGestrueAction(_:)))
        view.addGestureRecognizer(panGestrue)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(backBtn)
    }
    
    deinit {
        print("go die")
    }
    
    func panGestrueAction(pan:UIPanGestureRecognizer) {
        switch pan.state {
        case .Ended,.Cancelled:
            if abs((pan.view!.transform.b)) > 0.16 {  // 掉下去
                dismissViewControllerAnimated(true, completion: nil)
            }else{  // 还原
                pan.view?.transform = CGAffineTransformIdentity
            }
        default:
            let offX = pan.translationInView(pan.view).x
            let percent = offX / view.frame.width
            let radios = percent * CGFloat(M_PI_4)
            pan.view?.transform = CGAffineTransformMakeRotation(radios)
        }
    }

    
    func backBtnClick() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    private lazy var backBtn:UIButton = {
        let btn = UIButton(type: UIButtonType.Custom)
        btn.frame = CGRect(x: 10, y: 30, width: 23, height: 23)
        btn.setImage(UIImage(named:"home_nav_bar_fullscreen_back_icon_highlight"), forState: .Normal)
        btn.addTarget(self, action: #selector(ScottViewController.backBtnClick), forControlEvents: .TouchUpInside)
        
        return btn
    }()
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
