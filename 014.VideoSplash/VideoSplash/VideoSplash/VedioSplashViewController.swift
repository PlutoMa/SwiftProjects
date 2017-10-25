//
//  VedioSplashViewController.swift
//  VideoSplash
//
//  Created by Dareway on 2017/10/25.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit
import AVKit
import MediaPlayer

enum ScalingMode {
    case Resize
    case ResizeAspect
    case ResizeAspectFill
}

class VedioSplashViewController: UIViewController {
    
    private let moviePlayer = AVPlayerViewController()
    private var moviePlayerSoundLevel: Float = 1.0
    public var contentURL = NSURL() {
        didSet {
            setMoviePlayer(url: contentURL)
        }
    }
    public var videoFrame = CGRect()
    public var startTime: CGFloat = 0.0
    public var duration: CGFloat = 0.0
    public var backgroundColor = UIColor.black {
        didSet {
            view.backgroundColor = backgroundColor
        }
    }
    public var sound: Bool = true {
        didSet {
            if sound {
                moviePlayerSoundLevel = 1.0
            } else {
                moviePlayerSoundLevel = 0.0
            }
        }
    }
    public var alpha: CGFloat = CGFloat() {
        didSet {
            moviePlayer.view.alpha = alpha
        }
    }
    public var alwaysRepeat: Bool = true {
        didSet {
            if alwaysRepeat {
                NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: moviePlayer.player?.currentItem)
            }
        }
    }
    public var fillMode: ScalingMode = .ResizeAspectFill {
        didSet {
            switch fillMode {
            case .Resize:
                moviePlayer.videoGravity = AVLayerVideoGravity.resize.rawValue
            case .ResizeAspect:
                moviePlayer.videoGravity = AVLayerVideoGravity.resizeAspect.rawValue
            case .ResizeAspectFill:
                moviePlayer.videoGravity = AVLayerVideoGravity.resizeAspectFill.rawValue
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        moviePlayer.view.frame = videoFrame
        moviePlayer.showsPlaybackControls = false
        view.addSubview(moviePlayer.view)
        view.sendSubview(toBack: moviePlayer.view)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setMoviePlayer(url: NSURL) -> Void {
        let videoCutter = VideoCutter()
        videoCutter.cropVideoWithUrl(videoUrl: url, startTime: startTime, duration: duration) { (pathUrl, error) in
            DispatchQueue.main.async {
                if let path = pathUrl {
                    self.moviePlayer.player = AVPlayer(url: path as URL)
                    self.moviePlayer.player?.play()
                    self.moviePlayer.player?.volume = self.moviePlayerSoundLevel
                }
            }
        }
    }
    
    @objc
    private func playerItemDidReachEnd() -> Void {
        moviePlayer.player?.seek(to: kCMTimeZero)
        moviePlayer.player?.play()
    }

}
