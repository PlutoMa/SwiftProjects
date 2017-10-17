//
//  ViewController.swift
//  FindMyPosition
//
//  Created by Dareway on 2017/10/17.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    let locationLabel = UILabel()
    let locationStrLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        let bgImageView = UIImageView(frame: view.bounds)
        bgImageView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        bgImageView.image = UIImage(named: "phoneBg.jpeg")
        view.addSubview(bgImageView)
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        blurView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        view.addSubview(blurView)
        
        locationLabel.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: 100)
        locationLabel.textAlignment = .center
        locationLabel.textColor = UIColor.white
        view.addSubview(locationLabel)
        
        locationStrLabel.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 50)
        locationStrLabel.textAlignment = .center
        locationStrLabel.textColor = UIColor.white
        view.addSubview(locationStrLabel)
        
        let findBtn = UIButton(type: .custom)
        findBtn.frame = CGRect(x: 50, y: view.frame.height - 80, width: view.frame.width - 100, height: 50)
        findBtn.setTitle("Find My Position", for: .normal)
        findBtn.setTitleColor(UIColor.white, for: .normal)
        findBtn.addTarget(self, action: #selector(findBtnAction), for: .touchUpInside)
        view.addSubview(findBtn)
    }
    
    ///findBtnAction
    @objc
    func findBtnAction() -> Void {
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        guard location != nil else {
            return
        }
        let locationStr = "lat: \(location!.coordinate.latitude) lng: \(location!.coordinate.longitude)"
        locationLabel.text = locationStr
        locationManager.stopUpdatingLocation()
        reverseGeocode(location: location!)
    }
    
    func reverseGeocode(location: CLLocation) -> Void {
        geocoder.reverseGeocodeLocation(location) { (placeMark, error) in
            if error == nil {
                let mark = placeMark?.first
                let addressDictionary = mark?.addressDictionary
                let country = addressDictionary!["Country"] as! String
                let city = addressDictionary!["City"] as! String
                let street = addressDictionary!["Street"] as! String
                
                let finalAddress = "\(street), \(city), \(country)"
                self.locationStrLabel.text = finalAddress
            }
        }
    }
}

