//
//  ViewController.swift
//  ColorGradient
//
//  Created by Dareway on 2017/10/18.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let gradientLayer = CAGradientLayer()
    let timeLabel = UILabel()
    let temperatureLabel = UILabel()
    var colorSets = [[CGColor]]()
    var currentTime: Int = 0 {
        didSet {
            guard currentTime > 0 && currentTime < 24 else {
                return
            }
            timeLabel.text = "\(currentTime):00"
            if currentTime > 12 {
                temperatureLabel.text = "\(highestTemperature - currentTime)℃"
                gradientLayer.colors = colorSets[colorSets.count - 1 - (currentTime - 12)]
            } else {
                temperatureLabel.text = "\(lowestTemperature + currentTime - 1)℃"
                gradientLayer.colors = colorSets[currentTime - 1]
            }
        }
    }
    var lastValue: Int = 0
    
    let brightestSkyColor_R = 21.0
    let brightestSkyColor_G = 105.0
    let brightestSkyColor_B = 203.0
    let darkestSkyColor_R = 8.0
    let darkestSkyColor_G = 33.0
    let darkestSkyColor_B = 63.0
    
    let highestTemperatureColor_R = 255.0
    let highestTemperatureColor_G = 200.0
    let highestTemperatureColor_B = 101.0
    let lowestTemperatureColor_R = 47.0
    let lowestTemperatureColor_G = 169.0
    let lowestTemperatureColor_B = 199.0
    
    let lowestTemperature = 18
    let highestTemperature = 41
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createColorSets()
        
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
        
        timeLabel.frame = CGRect(x: 50, y: 40, width: 100, height: 100)
        timeLabel.textColor = UIColor.white
        timeLabel.font = UIFont.systemFont(ofSize: 28)
        view.addSubview(timeLabel)
        
        temperatureLabel.frame = CGRect(x: 250, y: 40, width: 100, height: 100)
        temperatureLabel.textColor = UIColor.white
        temperatureLabel.font = UIFont.systemFont(ofSize: 28)
        view.addSubview(temperatureLabel)
        
        currentTime = 1
        lastValue = 1
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handelPanGesture(sender:)))
        self.view.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc
    func handelPanGesture(sender: UIPanGestureRecognizer) {
        let tranY = sender.translation(in: view).y
        let space = view.frame.height / 22
        let change = Int(tranY / space)
        let newValue = lastValue + change
        guard newValue > 0 && newValue < 24 else {
            return
        }
        currentTime = newValue
        
        if sender.state == .ended {
            lastValue = currentTime
        }
    }
    
    func createColorSets() -> Void {
        for i in 0...12 {
            let index = Double(i)
            let sky_r = darkestSkyColor_R + (brightestSkyColor_R - darkestSkyColor_R) * (index - 1) / 11.0
            let sky_g = darkestSkyColor_G + (brightestSkyColor_G - darkestSkyColor_G) * (index - 1) / 11.0
            let sky_b = darkestSkyColor_B + (brightestSkyColor_B - darkestSkyColor_B) * (index - 1) / 11.0
            
            let tmpr_r = lowestTemperatureColor_R + (highestTemperatureColor_R - lowestTemperatureColor_R) * (index - 1) / 11.0
            let tmpr_g = lowestTemperatureColor_G + (highestTemperatureColor_G - lowestTemperatureColor_G) * (index - 1) / 11.0
            let tmpr_b = lowestTemperatureColor_B + (highestTemperatureColor_B - lowestTemperatureColor_B) * (index - 1) / 11.0
            
            let color = [UIColor(red: CGFloat(sky_r/255.0), green: CGFloat(sky_g/255.0), blue: CGFloat(sky_b/255.0), alpha: 1).cgColor,
                         UIColor(red: CGFloat(tmpr_r/255.0), green: CGFloat(tmpr_g/255.0), blue: CGFloat(tmpr_b/255.0), alpha: 1).cgColor]
            colorSets.append(color)
        }
    }
}

