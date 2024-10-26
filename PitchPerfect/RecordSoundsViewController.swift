//
//  ViewController.swift
//  PitchPerfect
//
//  Created by EarbajSaria on 13/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dashboardText: UILabel!
    
    @IBOutlet weak var recordingButton: UIButton!
    
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        print("View Did Load")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("View Did Appear")
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("View Will Appear")
        dashboardText.text = "Tap Play Button to Start Recording"
        stopRecordingButton.isEnabled = false
        stopRecordingButton.alpha = 0.5
        super.viewWillAppear(animated)
    }

    @IBAction func playAudio(_ sender: Any) {
        dashboardText.text = "Recording Started....."
        stopRecordingButton.isEnabled = true
        recordingButton.isEnabled = false
        recordingButton.alpha = 0.5
        stopRecordingButton.alpha = 1
    }
    
    @IBAction func stopAudio(_ sender: Any) {
        dashboardText.text = "Tap To record"
        recordingButton.isEnabled = true
        stopRecordingButton.isEnabled = false
        stopRecordingButton.alpha = 0.5
        recordingButton.alpha = 1

    }
}

