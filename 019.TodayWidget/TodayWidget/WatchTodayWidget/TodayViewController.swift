//
//  TodayViewController.swift
//  WatchTodayWidget
//
//  Created by Dareway on 2017/11/1.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var label: UILabel!
    var timer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults(suiteName: "group.cn.com.Pluto.TodayWidget")
        var leftTimeWhenQuit = userDefaults?.double(forKey: "lefttime")
        
        label.text = String(format: "%0.1f", leftTimeWhenQuit!)
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (Timer) in
            leftTimeWhenQuit = leftTimeWhenQuit! + 0.1
            
            self.label.text = String(format: "%0.1f", leftTimeWhenQuit!)
        }
        self.timer.fire()
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.newData)
    }
    
}
