//
//  TutorialController.swift
//  OMG-WOW!+ Fun
//
//  Created by Ari Wasch on 7/22/20.
//  Copyright © 2020 Ari Wasch. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit
import AVKit

import AVFoundation

class TutorialController: UIViewController {
    let defaults = UserDefaults.standard

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playVideo()
    }

    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "output", ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: nil)

    }

    @objc func playerDidFinishPlaying(note: NSNotification) {
        performSegue(withIdentifier: "tutorialToLevelSelect", sender: nil)
        defaults.set(false, forKey: "startview")

    }
}
