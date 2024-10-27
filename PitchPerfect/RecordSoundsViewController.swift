//
//  RecordSoundsViewComntroller.swift
//  PitchPerfect
//
//  Created by EarbajSaria on 13/10/24.
//

import UIKit
import AVFoundation

class RecordSoundsViewComntroller: UIViewController, AVAudioRecorderDelegate {
    
    // AVAudioRecorder instance to handle recording functionalities
    var audioRecorder: AVAudioRecorder!
    
    // UI label displaying the current status to the user
    @IBOutlet weak var dashboardText: UILabel!
    
    // Button to start recording audio
    @IBOutlet weak var recordingButton: UIButton!
    
    // Button to stop recording audio
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    // Called after the controller's view is loaded into memory
    override func viewDidLoad() {
        
        print("View Did Load")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    // Called just before the view is presented to the user
    override func viewDidAppear(_ animated: Bool) {
        
        print("View Did Appear")
        super.viewDidAppear(animated)
        
    }
    
    // Called each time the view is about to be presented
    override func viewWillAppear(_ animated: Bool) {
        
        // Initial setup for UI elements
        print("View Will Appear")
        dashboardText.text = "Tap Play Button to Start Recording"
        stopRecordingButton.isEnabled = false
        stopRecordingButton.alpha = 0.5
        super.viewWillAppear(animated)
        
    }

    // Action for recording button to start audio recording
    @IBAction func playAudio(_ sender: Any) {
        
        dashboardText.text = "Recording Started....."  // Update status label
        stopRecordingButton.isEnabled = true  // Enable stop button while recording
        recordingButton.isEnabled = false  // Disable recording button while recording
        recordingButton.alpha = 0.5  // Reduce opacity for disabled button
        stopRecordingButton.alpha = 1  // Set stop button opacity to normal

        // Set up the file path to save recorded audio in the app's document directory
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"  // Name of the audio file
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))  // Full file path URL
                
        // Set up audio session and configure to play and record
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

        // Initialize audioRecorder with the file path and default settings
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true  // Enable metering for visual feedback
        audioRecorder.prepareToRecord()  // Prepare audioRecorder for recording
        audioRecorder.record()  // Start recording
        
    }
    
    // Action for stop button to end audio recording
    @IBAction func stopAudio(_ sender: Any) {
        
        dashboardText.text = "Tap To record"  // Reset label text
        recordingButton.isEnabled = true  // Enable recording button again
        stopRecordingButton.isEnabled = false  // Disable stop button after stopping recording
        stopRecordingButton.alpha = 0.5  // Reduce stop button opacity
        recordingButton.alpha = 1  // Reset recording button opacity

        audioRecorder.stop()  // Stop audio recording
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)  // Deactivate audio session to save resources

    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: recorder.url)
            print("Recording successfull")
        }else{
            print("Recording was not successfull")
        }
        
    }
    
}

