//
//  AnimationsViewControllers.swift
//  BasicAnimations
//
//  Created by Dareway on 2017/11/3.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

// MARK: - PositionAnimationViewController
class PositionAnimationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Position"
        view.backgroundColor = UIColor.white
        let rockManView = UIImageView(image: UIImage(named: "rockman"))
        rockManView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        rockManView.center.y = view.center.y
        rockManView.frame.origin.x = 10
        view.addSubview(rockManView)
        
        let triggerButton = UIButton(type: .roundedRect)
        triggerButton.setTitle("Fire", for: .normal)
        triggerButton.layer.borderColor = UIColor.black.cgColor
        triggerButton.layer.borderWidth = 1
        triggerButton.addTarget(self, action: #selector(fire), for: .touchUpInside)
        triggerButton.frame.size = CGSize(width: 100, height: 50)
        triggerButton.center.x = view.center.x
        triggerButton.center.y = view.frame.height - 150
        view.addSubview(triggerButton)
    }
    
    @objc
    func fire() -> Void {
        let bulletView = UIView()
        bulletView.backgroundColor = UIColor.green
        bulletView.frame.size = CGSize(width: 10, height: 10)
        bulletView.layer.cornerRadius = 5
        bulletView.layer.masksToBounds = true
        bulletView.center.y = view.center.y - 5
        bulletView.frame.origin.x = 200
        view.addSubview(bulletView)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            bulletView.frame.origin.x = self.view.frame.size.width + 10
        }) { (_) in
            bulletView.removeFromSuperview()
        }
    }
}


// MARK: - OpacityAnimationViewController
class OpacityAnimationViewController: UIViewController {
    
    let imageView = UIImageView(image: UIImage(named: "jobs"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Opacity"
        view.backgroundColor = UIColor.white
        imageView.frame = view.bounds
        view.addSubview(imageView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imageView.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1) {
            self.imageView.alpha = 1.0
        }
    }
}


// MARK: - ScaleAnimationViewController
class ScaleAnimationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Scale"
        view.backgroundColor = UIColor.white
        let heartView = UIImageView(image: UIImage(named: "heart"))
        heartView.frame.size = CGSize(width: 223, height: 240)
        heartView.center = view.center
        view.addSubview(heartView)
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { (timer) in
            UIView.animate(withDuration: 0.5, animations: {
                heartView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }, completion: { (_) in
                UIView.animate(withDuration: 0.5, animations: {
                    heartView.transform = CGAffineTransform.identity
                })
            })
        }
        timer.fire()
    }
    
}


// MARK: - ColorAnimationViewController
class ColorAnimationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Color"
        view.backgroundColor = UIColor.white
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40)
        label.textColor = UIColor.black
        label.text = "Pluto"
        view.addSubview(label)
        label.sizeToFit()
        label.center = view.center
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1) {
            self.view.backgroundColor = UIColor.brown
        }
    }
    
}


// MARK: - RotationAnimationViewController
class RotationAnimationViewController: UIViewController {
    
    let rollingBallView = UIImageView(image: UIImage(named: "rollingBall"))
    var angle: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Rotation"
        view.backgroundColor = UIColor.white
        rollingBallView.frame.size = CGSize(width: 100, height: 100)
        rollingBallView.center = view.center
        view.addSubview(rollingBallView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { (_) in
            self.angle = self.angle - 0.04
            if self.angle < -CGFloat(Double.pi) * 2 {
                self.angle = 0.0
            }
            UIView.animate(withDuration: 0.02, animations: {
                self.rollingBallView.transform = CGAffineTransform(rotationAngle: self.angle)
            })
        }
        timer.fire()
    }
    
}
