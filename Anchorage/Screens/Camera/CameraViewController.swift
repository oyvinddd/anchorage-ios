//
//  CameraViewController.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 19/04/2024.
//

import UIKit
import AVFoundation

final class CameraViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    /*
    private lazy var frameLinesView: ScannerFrameLinesView = {
        return ScannerFrameLinesView()
    }()
    
    private lazy var cameraView: UIView = {
        return UIView.createView(.black)
    }()
    
    private lazy var shadowView: UIView = {
        return UIView.createView(.black)
    }()
    
    private lazy var activateCameraButton: OSButton = {
        let button = OSButton("Enable camera", type: .primary)
        button.addTarget(self, action: #selector(activateCameraButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var cameraIsActive: Bool {
        captureSession != nil && captureSession.isRunning
    }
    
    private var captureSession: AVCaptureSession!
    private var previewLayer: AVCaptureVideoPreviewLayer!
    private var isShowingMatchRegistration: Bool = false
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        determineCameraStatus()
        setupChildViews()
        configureUI()
    }
    
    private func setupChildViews() {
        view.addSubview(activateCameraButton)
        
        NSLayoutConstraint.pinToView(view, cameraView)
        NSLayoutConstraint.pinToView(view, shadowView)
        
        view.addSubview(frameLinesView)
        
        NSLayoutConstraint.activate([
            activateCameraButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            activateCameraButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            activateCameraButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activateCameraButton.heightAnchor.constraint(equalToConstant: 50),
            frameLinesView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            frameLinesView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            frameLinesView.heightAnchor.constraint(equalTo: frameLinesView.widthAnchor),
            frameLinesView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            frameLinesView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20)
        ])
    }
    
    private func configureUI() {
        view.backgroundColor = .black
    }
    
    private func determineCameraStatus() {
        let cameraIsActive = AVCaptureDevice.authorizationStatus(for: .video) == .authorized
        cameraView.isHidden = !cameraIsActive
        frameLinesView.isHidden = !cameraIsActive
    }
    
    private func stopCaptureSession() {
        if captureSession != nil && captureSession.isRunning {
            captureSession.stopRunning()
        }
    }
    
    private func requestCameraAccess() {
        AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
            DispatchQueue.main.async { [weak self] in
                self?.determineCameraStatus()
                if granted {
                    self?.startCaptureSession()
                }
            }
        }
    }
    
    private func startCaptureSession() {
        // exit early if camera has not been enabled by the user or if it is already active
        let hasAuthorizedCamera = AVCaptureDevice.authorizationStatus(for: .video) == .authorized
        guard hasAuthorizedCamera && !cameraIsActive else {
            return
        }
        // initialize and configure capture session
        captureSession = AVCaptureSession()
        captureSession.beginConfiguration()
        captureSession.commitConfiguration()
        
        guard let videoInput = createVideoInput(), captureSession.canAddInput(videoInput) else {
            return
        }
        captureSession.addInput(videoInput)
        
        let metadataOutput = AVCaptureMetadataOutput()
        guard captureSession.canAddOutput(metadataOutput) else {
            return
        }
        
        captureSession.addOutput(metadataOutput)
        
        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.global(qos: .userInitiated))
        metadataOutput.metadataObjectTypes = [.qr]
        
        // init the camera view in the UI
        previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
        previewLayer.frame = self.view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        cameraView.layer.addSublayer(self.previewLayer)
        
        // start the capture session
        DispatchQueue.global(qos: .background).async { [unowned self] in
            self.captureSession.startRunning()
        }
    }
    
    func handleTouch(point: CGPoint) {
        guard !cameraIsActive else { return }
        // since the button is covered by a scroll view, we need
        // to indirectly check if the user tapped within the frame
        // of the button and then send the touch action
        if activateCameraButton.frame.contains(point) {
            activateCameraButton.sendActions(for: .touchUpInside)
        }
    }
    
    func handleShadowViewOpacity(_ contentOffset: CGPoint) {
        let width = view.frame.width
        // set opacity of shadow view based on how much of the camera is showing
        shadowView.alpha = contentOffset.x / view.frame.width
        if contentOffset.x == width && cameraIsActive {
            stopCaptureSession()
        } else if contentOffset.x < width && !cameraIsActive {
            startCaptureSession()
        }
    }
    
    private func createVideoInput() -> AVCaptureDeviceInput? {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            return nil
        }
        
        do {
            return try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch let error {
            print(error)
            return nil
        }
    }
    
    @objc private func activateCameraButtonTapped(_ sender: UIButton) {
        let authorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        switch authorizationStatus {
        case .authorized:
            startCaptureSession()
        case .denied, .notDetermined:
            requestCameraAccess()
        case .restricted:
            // user can't grant access due to restriction on the OS level
            print("Camera usage is restricted for this device")
        @unknown default:
            fatalError("Unknown camera status")
        }
    }
     */
}
