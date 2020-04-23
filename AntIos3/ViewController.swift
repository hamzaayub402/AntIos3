//
//  ViewController.swift
//  AntIos3
//
//  Created by Hamza Ayub on 4/23/20.
//  Copyright © 2020 Hamza Ayub. All rights reserved.
//

import UIKit
import WebRTC
import AntMediaSDK
class ViewController: UIViewController {

    @IBOutlet weak var fullVideoView: UIView!
    
    let client: AntMediaClient = AntMediaClient.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        override func viewWillAppear(_ animated: Bool) {
            print("viewWillAppear")
            super.viewWillAppear(animated)
            self.client.delegate = self
            self.client.setDebug(true)
            self.client.setOptions(url: "ws://34.255.219.25:5080/WebRTCAppEE/websocket", streamId: "ios1", token: "", mode: AntMediaClientMode.publish)
            self.client.setCameraPosition(position: .back)
            self.client.setScaleMode(mode: .scaleAspectFit)
            self.client.setTargetResolution(width: 480, height: 360)
            self.client.setLocalView(container: fullVideoView)
    //        self.client.startInternal()
            self.client.start()
        }

}

extension ViewController: AntMediaClientDelegate {

    func clientDidConnect(_ client: AntMediaClient) {
        print("VideoViewController: Connected")
    }

    func clientDidDisconnect(_ message: String) {
        print("VideoViewController: Disconnected: \(message)")
    }

    func clientHasError(_ message: String) {
        print("clientHasError : \(message)")
    }


    func disconnected() {
        print("Disconnected")
    }

    func remoteStreamStarted() {
        print("Remote stream started")
    }

    func remoteStreamRemoved() {
        print("Remote stream removed")
    }

    func localStreamStarted() {
        print("Local stream added")
    }


    func playStarted()
    {
        print("play started");

    }

    func playFinished() {
        print("play finished")
    }

    func publishStarted()
    {
        print("publishStarted")
    }

    func publishFinished() {
        print("publishFinished")
    }

    func audioSessionDidStartPlayOrRecord() {
        print("audioSessionDidStartPlayOrRecord")
    }
}

