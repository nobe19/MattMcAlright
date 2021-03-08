//
//  ViewController.swift
//  HowIsMatt
//
//  Created by Nipuni Obe on 3/8/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var alrightNumLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alrightNumLabel.text = "\(Int(stepper.value))"
    }
    
    func playSound(name: String, numberOfLoops: Int) {
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.numberOfLoops = numberOfLoops - 1
                audioPlayer.play()
            } catch {
                print("😡 ERROR: \(error.localizedDescription) Could not initialize AVAudioPlayer object.")
            }
        } else {
            print("😡 ERROR: Could not read data from file sound0")
        }
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        alrightNumLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func tellMePressed(_ sender: UIButton) {
        playSound(name: "alright", numberOfLoops: Int(stepper.value))
    }
}


