//
//  CustomCollectionViewCell.swift
//  CustomTransition
//
//  Created by Dareway on 2017/11/6.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    public func configCell(model: CustomModel) -> Void {
        imageView.image = model.image
        imageView.frame = contentView.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
