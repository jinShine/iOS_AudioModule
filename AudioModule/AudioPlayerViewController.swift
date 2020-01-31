//
//  AudioPlayerViewController.swift
//  AudioModule
//
//  Created by Seungjin on 31/01/2020.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit
import AVFoundation

class AudioPlayerViewController: UIViewController {

  @IBOutlet weak var playPauseButton: UIButton!

  var player: AVAudioPlayer!
  var audioFileURL: URL? {
    didSet {
      if let url = audioFileURL {
        do {
          player = try AVAudioPlayer(contentsOf: url)
        } catch {
          print("Error", error.localizedDescription)
        }
      }
    }
  }
  var timer: Timer?

  override func viewDidLoad() {
    super.viewDidLoad()
    configureAudioPlayer()
    print(player.currentTime)
    print(player.numberOfChannels)
    print(player.duration)
    print(player.format)
    print(player.volume)
  }

  private func configureAudioPlayer() {
    //audioFileURL = Bundle.main.url(forResource: "Intro", withExtension: "mp4")
    audioFileURL = Bundle.main.url(forResource: "SampleMusic", withExtension: "mp3")
    player.delegate = self
//    player.prepareToPlay()
  }

  @IBAction func playTapped(_ sender: UIButton) {
    if player.isPlaying {
      player.pause()
    } else {
      player.enableRate = true
      if player.enableRate {
//        player.rate = 2.0
      } else {
        print("NO")
      }
      player.play()
//      timer = Timer.scheduledTimer(timeInterval: <#T##TimeInterval#>, target: <#T##Any#>, selector: <#T##Selector#>, userInfo: <#T##Any?#>, repeats: <#T##Bool#>)
      Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in

        print(self.formatted(time: Float(self.player.duration)))
      }



    }
  }

  enum TimeConstant {
    static let secsPerMin = 60
    static let secsPerHour = TimeConstant.secsPerMin * 60
  }

  func formatted(time: Float) -> String {
    var secs = Int(ceil(time))
    var hours = 0
    var mins = 0

    if secs > TimeConstant.secsPerHour {
      hours = secs / TimeConstant.secsPerHour
      secs -= hours * TimeConstant.secsPerHour
    }

    if secs > TimeConstant.secsPerMin {
      mins = secs / TimeConstant.secsPerMin
      secs -= mins * TimeConstant.secsPerMin
    }

    var formattedString = ""
    if hours > 0 {
      formattedString = "\(String(format: "%02d", hours)):"
    }
    formattedString += "\(String(format: "%02d", mins)):\(String(format: "%02d", secs))"
    return formattedString
  }
}

extension AudioPlayerViewController: AVAudioPlayerDelegate {

  //is called when a sound has finished playing
  func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
    print("\n-------------- [audioPlayerDidFinishPlaying] --------------\n")
    print("Successfully :", flag)
  }

  //if an error occurs while decoding it will be reported to the delegate.
  func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
    print("\n-------------- [audioPlayerDecodeErrorDidOccur] --------------\n")
    print("Error :", error?.localizedDescription)
  }

}
