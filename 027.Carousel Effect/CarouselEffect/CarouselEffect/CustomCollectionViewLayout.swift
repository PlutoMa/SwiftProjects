//
//  CustomCollectionViewLayout.swift
//  CarouselEffect
//
//  Created by Dareway on 2017/11/7.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class CustomCollectionViewLayout: UICollectionViewFlowLayout {
    
    var itemWH: CGFloat!
    var inset: CGFloat!
    
    override func prepare() {
        super.prepare()
        let collectionW = self.collectionView?.frame.size.width
        let collectionH = self.collectionView?.frame.size.height
        self.itemSize = CGSize(width: collectionW! * 0.5, height: collectionW! * 0.6)
        let leftRight = (collectionW! - self.itemSize.width) * 0.5
        let topBottom = (collectionH! - self.itemSize.height) * 0.5
        self.sectionInset = UIEdgeInsetsMake(topBottom, leftRight, topBottom, leftRight)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        var lastRect = CGRect()
        lastRect.size = (self.collectionView?.frame.size)!
        lastRect.origin = proposedContentOffset;
        
        let centerX = proposedContentOffset.x + (self.collectionView?.frame.size.width)! * 0.5
        var adjustX = MAXFLOAT
        let array = self.layoutAttributesForElements(in: lastRect)
        for attr in array! {
            if (abs(Float(attr.center.x - centerX)) < abs(adjustX)) {
                adjustX = Float(attr.center.x - centerX)
            }
        }
        return CGPoint(x: proposedContentOffset.x + CGFloat(adjustX), y: proposedContentOffset.y)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let newArr = super.layoutAttributesForElements(in: rect)
        let collectionViewCenterX = (self.collectionView?.frame.size.width)! * 0.5 + (self.collectionView?.contentOffset.x)!
        
        for attributes in newArr! {
            let scale = 1 - abs(attributes.center.x - collectionViewCenterX) / (self.collectionView?.frame.size.width)! * 0.5;
            attributes.transform = CGAffineTransform(scaleX: scale, y: scale);
        }
        return newArr
        
    }
    
}
