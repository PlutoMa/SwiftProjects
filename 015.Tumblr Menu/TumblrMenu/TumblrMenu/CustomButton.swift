//
//  CustomButton.swift
//  TumblrMenu
//
//  Created by Dareway on 2017/10/25.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

enum ButtonImagePosition : Int {
    case PositionTop = 0
    case PositionLeft
    case PositionBottom
    case PositionRight
}

class CustomButton: UIButton {
    var positionType: ButtonImagePosition = .PositionTop
    var space: CGFloat = 0.0
    
    func setImageAndTitle(imageName: String, title: String, positionType: ButtonImagePosition, space: CGFloat) -> Void {
        
        setImage(UIImage(named: imageName), for: .normal)
        setTitle(title, for: .normal)
        setTitleColor(UIColor.white, for: .normal)
        
        self.positionType = positionType
        self.space = space
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        switch positionType {
        case .PositionTop:
            var imageViewLength = frame.height - 3 * space - (titleLabel?.intrinsicContentSize.height ?? 0.0)
            if imageViewLength > frame.width {
                imageViewLength = frame.width
            }
            imageView?.frame = CGRect(x: 0, y: 0, width: imageViewLength, height: imageViewLength)
            imageView?.center = CGPoint(x: frame.width / 2.0, y: space + imageViewLength / 2.0)
            titleLabel?.frame = CGRect(x: 0, y: 0, width: titleLabel?.intrinsicContentSize.width ?? 0.0, height: titleLabel?.intrinsicContentSize.height ?? 0.0)
            titleLabel?.center = CGPoint(x: frame.width / 2.0, y: frame.height - space - ((titleLabel?.intrinsicContentSize.height ?? 0.0) / 2.0))
            break
        case .PositionLeft:
            break
        case .PositionBottom:
            break
        case .PositionRight:
            break
        }
    }
}

