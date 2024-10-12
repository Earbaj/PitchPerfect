//
//  ViewController.swift
//  PitchPerfect
//
//  Created by EarbajSaria on 13/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dashboardText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playAudio(_ sender: Any) {
        dashboardText.text = "Recording Started....."
    }
    
    @IBAction func stopAudio(_ sender: Any) {
        dashboardText.text = "Recording Stop!!!"
    }
}

