//
//  ViewController.swift
//  Watch
//
//  Created by Dareway on 2017/10/17.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let resetButton = UIButton(type: .custom)
    let resultLabel = UILabel()
    let startButton = UIButton(type: .custom)
    let endButton = UIButton(type: .custom)
    var timer: Timer?
    var resultNumber: Double = 0 {
        didSet {
            resultLabel.text = String(format: "%.1f", resultNumber)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 224.0 / 255.0, green: 203.0 / 255.0, blue: 182.0 / 255.0, alpha: 1.0)
        
        //resetButton
        resetButton.setTitleColor(UIColor.white, for: .normal)
        resetButton.setTitle("Reset", for: .normal)
        resetButton.addTarget(self, action: #selector(resetButtonAction), for: .touchUpInside)
        view.addSubview(resetButton)
        resetButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(10.0)
            maker.right.equalTo(-10.0)
            maker.width.equalTo(100.0)
            maker.height.equalTo(50.0)
        }
        
        //resultLabel
        resultLabel.textColor = UIColor.black
        resultLabel.font = UIFont.systemFont(ofSize: 30.0)
        resultLabel.textAlignment = .center
        view.addSubview(resultLabel)
        resultLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(100.0)
            maker.centerX.equalTo(self.view.snp.centerX)
            maker.width.equalTo(self.view.snp.width)
            maker.height.equalTo(50.0)
        }
        self.resultNumber = 0
        
        //startButton
        startButton.backgroundColor = UIColor(red: 1.0, green: 101.0 / 255.0, blue: 27.0 / 255.0, alpha: 1.0)
        startButton.setTitle("Start", for: .normal)
        startButton.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        view.addSubview(startButton)
        startButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.view.snp.top).offset(300.0)
            maker.bottom.equalTo(self.view.snp.bottom).offset(0)
            maker.left.equalTo(self.view.snp.left).offset(0)
            maker.width.equalTo(self.view.snp.width).multipliedBy(0.5)
        }
        
        //endButton
        endButton.backgroundColor = UIColor(red: 98.0 / 255.0, green: 242.0 / 255.0, blue: 23.0 / 255.0, alpha: 1.0)
        endButton.setTitle("End", for: .normal)
        endButton.addTarget(self, action: #selector(endButtonAction), for: .touchUpInside)
        view.addSubview(endButton)
        endButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(startButton.snp.top)
            maker.left.equalTo(startButton.snp.right)
            maker.width.equalTo(startButton.snp.width)
            maker.height.equalTo(startButton.snp.height)
        }
    }
    
    ///resetButtonAction
    @objc
    func resetButtonAction() -> Void {
        self.resultNumber = 0.0
    }
    
    ///startButtonAction
    @objc
    func startButtonAction() -> Void {
        guard timer == nil else {
            return
        }
        resultNumber = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
            self.resultNumber = self.resultNumber + 0.1
        })
        timer?.fire()
    }
    
    ///endButtonAction
    @objc
    func endButtonAction() -> Void {
        guard timer != nil else {
            return
        }
        timer!.invalidate()
        timer = nil
    }

}

