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

extension UIButton {
    func setImageAndTitle(imageName: String, title: String, positionType: ButtonImagePosition, space: CGFloat) -> Void {
        
        setImage(UIImage(named: imageName), for: .normal)
        setTitle(title, for: .normal)
        setTitleColor(UIColor.white, for: .normal)

        let imageViewLength = frame.height - 3 * space - titleLabel!.intrinsicContentSize.height
        
        var imageEdgeInsets = UIEdgeInsets()
        var titleEdgeInsets = UIEdgeInsets()
        
        switch positionType {
        case .PositionTop:
            imageEdgeInsets = UIEdgeInsetsMake(space, (frame.width - imageViewLength) / 2.0, space * 2 + titleLabel!.intrinsicContentSize.height, (frame.width - imageViewLength) / 2.0)
            titleEdgeInsets = UIEdgeInsetsMake(space, <#T##left: CGFloat##CGFloat#>, <#T##bottom: CGFloat##CGFloat#>, <#T##right: CGFloat##CGFloat#>)
            break
        case .PositionLeft:
            break
        case .PositionBottom:
            break
        case .PositionRight:
            break
        }
        
        self.imageEdgeInsets = imageEdgeInsets
        self.titleEdgeInsets = titleEdgeInsets
        
    }
}
