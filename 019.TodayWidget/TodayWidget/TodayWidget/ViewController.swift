//
//  ViewController.swift
//  TodayWidget
//
//  Created by Dareway on 2017/11/1.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let result: UILabel = UILabel.init(frame: CGRect.zero)
    var timer: Timer?
    var labelNumber: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(result)
        result.textColor = UIColor.black
        result.snp.makeConstraints { (maker) in
            maker.width.equalTo(100.0)
            maker.height.equalTo(50.0)
            maker.centerX.equalTo(self.view.snp.centerX).offset(25.0)
            maker.top.equalTo(view.snp.top).offset(100)
        }
        result.font = UIFont.systemFont(ofSize: 30.0)
        result.text = "0"
        
        let startView = UIView()
        startView.backgroundColor = UIColor.init(red: 255.0 / 255.0, green: 101.0 / 255.0, blue: 27.0 / 255.0, alpha: 1.0)
        view.addSubview(startView)
        startView.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.view.snp.top).offset(300.0)
            maker.leading.equalTo(self.view.snp.leading)
            maker.width.equalTo(self.view.snp.width).multipliedBy(0.5)
            maker.bottom.equalTo(self.view.snp.bottom)
        }
        
        let startButton = UIButton.init(type: .custom)
        startButton.setTitle("Start", for: .normal)
        startView.addSubview(startButton)
        startButton.snp.makeConstraints { (maker) in
            maker.center.equalTo(startView.snp.center)
            maker.width.height.equalTo(50.0)
        }
        startButton.addTarget(self, action: #selector(startHandler), for: .touchUpInside)
        
        let endView = UIView()
        endView.backgroundColor = UIColor.init(red: 98.0 / 255.0, green: 242.0 / 255.0, blue: 23.0 / 255.0, alpha: 1.0)
        view.addSubview(endView)
        endView.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.view.snp.top).offset(300.0)
            maker.trailing.equalTo(self.view.snp.trailing)
            maker.width.equalTo(self.view.snp.width).multipliedBy(0.5)
            maker.bottom.equalTo(self.view.snp.bottom)
        }
        
        let endButton = UIButton.init(type: .custom)
        endButton.setTitle("End", for: .normal)
        endView.addSubview(endButton)
        endButton.snp.makeConstraints { (maker) in
            maker.center.equalTo(endView.snp.center)
            maker.width.height.equalTo(50.0)
        }
        endButton.addTarget(self, action: #selector(stopHandler), for: .touchUpInside)
        
        let resetButton = UIButton.init(type: .custom)
        resetButton.setTitle("Reset", for: .normal)
        view.addSubview(resetButton)
        resetButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.view.snp.top).offset(10.0)
            maker.right.equalTo(self.view.snp.right).offset(-10.0)
            maker.width.equalTo(100.0)
            maker.height.equalTo(50.0)
        }
        resetButton.addTarget(self, action: #selector(resetHandler), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillResignActive), name: NSNotification.Name.UIApplicationWillResignActive, object: nil)
    }
    
    @objc
    func startHandler() -> Void {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
            self.labelNumber = self.labelNumber + 0.1
            self.result.text = String.init(format: "%0.1f", self.labelNumber)
        })
        timer?.fire()
    }
    
    @objc
    func stopHandler() -> Void {
        guard timer != nil else {
            return
        }
        timer?.invalidate()
        timer = nil
    }
    
    @objc
    func resetHandler() -> Void {
        labelNumber = 0
        result.text = "0"
    }
    
    
    @objc func applicationWillResignActive() -> Void {
        if timer == nil {
            clearDefaults()
        } else {
            if timer!.isValid {
                saveDefaults()
            } else {
                clearDefaults()
            }
        }
    }
    
    func saveDefaults() -> Void {
        let userDefault = UserDefaults.init(suiteName: "group.cn.com.Pluto.TodayWidget")
        userDefault?.set(self.labelNumber, forKey: "lefttime")
        userDefault?.synchronize()
    }
 
    private func clearDefaults() {
        let userDefault = UserDefaults(suiteName: "group.cn.com.Pluto.TodayWidget")
        userDefault?.removeObject(forKey: "lefttime")
        userDefault?.synchronize()
    }
    
}

