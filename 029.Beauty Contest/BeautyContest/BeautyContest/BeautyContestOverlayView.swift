//
//  BeautyContestOverlayView.swift
//  BeautyContest
//
//  Created by Dareway on 2017/11/8.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit
import Koloda

private let overlayRightImageName = "overlay_like"
private let overlayLeftImageName = "overlay_skip"

class BeautyContestOverlayView: OverlayView {
    lazy var overlayImageView: UIImageView! = {
        [unowned self] in
        var imageView = UIImageView(frame: self.bounds)
        self.addSubview(imageView)
        return imageView
    }()
    
    override var overlayState: SwipeResultDirection? {
        didSet {
            switch overlayState {
            case .left? :
                overlayImageView.image = UIImage(named: overlayLeftImageName)
            case .right? :
                overlayImageView.image = UIImage(named: overlayRightImageName)
            default:
                overlayImageView.image = nil
            }
        }
    }
}
