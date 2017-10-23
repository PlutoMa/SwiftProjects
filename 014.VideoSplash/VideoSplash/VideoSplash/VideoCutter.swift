//
//  VideoCutter.swift
//  VideoSplash
//
//  Created by Dareway on 2017/10/20.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit
import AVFoundation

extension String {
    var convert: NSString { return self as NSString }
}

class VideoCutter {
    func cropVideoWithUrl(videoUrl url: NSURL, startTime: CGFloat, duration: CGFloat, completion: ((_ videoPath: NSURL?, _ error: NSError?) -> Void)?) -> Void {
        DispatchQueue.global().async {
            let asset = AVURLAsset(url: url as URL, options: nil)
            let exportSession = AVAssetExportSession(asset: asset, presetName: "AVAssetExportPresetHighestQuality")
            let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
            var outputPath = paths.last!
            let fileManager = FileManager.default
            try? fileManager.createDirectory(atPath: outputPath, withIntermediateDirectories: true, attributes: nil)
            outputPath = outputPath.convert.appendingPathComponent("output.mp4")
            try? fileManager.removeItem(atPath: outputPath)
            if let exportSession = exportSession as AVAssetExportSession? {
                
            }
        }
    }
}
