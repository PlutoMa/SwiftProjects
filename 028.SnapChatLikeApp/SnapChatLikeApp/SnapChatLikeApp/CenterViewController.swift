//
//  CenterViewController.swift
//  SnapChatLikeApp
//
//  Created by Dareway on 2017/11/8.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit
import AVFoundation

class CenterViewController: UIViewController {

    let imageView = UIImageView()
    
    var captureSession: AVCaptureSession!
    var stillImageOutput: AVCapturePhotoOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
        imageView.frame = view.bounds
        view.addSubview(imageView)
        
        let captureBtn = UIButton(type: .custom)
        captureBtn.frame.size = CGSize(width: 48, height: 48)
        captureBtn.center.x = view.center.x
        captureBtn.frame.origin.y = view.frame.height - 100
        captureBtn.setImage(UIImage(named: "icon-take-photo"), for: .normal)
        captureBtn.addTarget(self, action: #selector(takePhoto), for: .touchUpInside)
        view.addSubview(captureBtn)
    
        let device = AVCaptureDevice.default(for: .video)
        if device != nil {
            do {
                let input = try AVCaptureDeviceInput(device: device!)
                if captureSession.canAddInput(input) {
                    captureSession.addInput(input)
                    stillImageOutput = AVCapturePhotoOutput()
                    if captureSession.canAddOutput(stillImageOutput) {
                        captureSession.addOutput(stillImageOutput)
                        
                        let captureVideoLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                        captureVideoLayer.frame = imageView.bounds
                        captureVideoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
                        imageView.layer.addSublayer(captureVideoLayer)
                        
                        captureSession.startRunning()
                    }
                }
            } catch {
                print(error)
            }
        }
    }
    
    @objc func takePhoto() -> Void {
        DispatchQueue.main.async { [unowned self] in
            self.view.layer.opacity = 0
            UIView.animate(withDuration: 0.25, animations: { [unowned self] in
                self.view.layer.opacity = 1
            })
        }
        
        let settingsForMonitoring = AVCapturePhotoSettings()
        settingsForMonitoring.flashMode = .auto
        settingsForMonitoring.isAutoStillImageStabilizationEnabled = true
        settingsForMonitoring.isHighResolutionPhotoEnabled = false
        stillImageOutput.capturePhoto(with: settingsForMonitoring, delegate: self)
    }
    
}

// MARK: - AVCapturePhotoCaptureDelegate
extension CenterViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ captureOutput: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?, previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        if let photoSampleBuffer = photoSampleBuffer {
            let photoData = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: photoSampleBuffer, previewPhotoSampleBuffer: previewPhotoSampleBuffer)
            let image = UIImage(data: photoData!)
            UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        }
    }
}


