//
//  AVAudioRecoderViewController.swift
//  AudioModule
//
//  Created by Seungjin on 04/02/2020.
//  Copyright © 2020 jinnify. All rights reserved.
//

import UIKit
import AVFoundation

class AVAudioRecoderViewController: UIViewController {

  //MARK:- Outlets
  @IBOutlet private var stopButton: UIButton!
  @IBOutlet private var playButton: UIButton!
  @IBOutlet private var recordButton: UIButton!
  @IBOutlet private var timeLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

// MARK: - Actions
extension AVAudioRecoderViewController {

  @IBAction func stop(sender: UIButton) {

  }

  @IBAction func play(sender: UIButton) {

  }

  @IBAction func record(sender: UIButton) {

  }

}
