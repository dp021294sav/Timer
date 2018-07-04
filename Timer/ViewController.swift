//
//  ViewController.swift
//  Timer
//
//  Created by Андрей Сергиенко on 04.07.18.
//  Copyright © 2018 Андрей Сергиенко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var switchValue: UISwitch!
    
    var seconds = 0
    var timer: Timer?
    
    func setTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func buttonIsEnabled(start: Bool, stop: Bool) {
        startButton.isEnabled = start
        stopButton.isEnabled = stop
    }
    
    func switchIsEnabled(condition: Bool) {
        switchValue.isEnabled = condition
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonIsEnabled(start: true, stop: false)
    }

    @IBAction func switchValueChanged(_ sender: Any) {
        buttonIsEnabled(start: true, stop: false)
    }
    @IBAction func startButtonPressed(_ sender: Any) {
        setTimer()
        buttonIsEnabled(start: false, stop: true)
        switchIsEnabled(condition: false)
    }
    @IBAction func stopButtonPressed(_ sender: Any) {
        timer?.invalidate()
        switchIsEnabled(condition: true)
        buttonIsEnabled(start: true, stop: false)
    }
    
    @objc func updateTimer() {
        if switchValue.isOn == true {
            seconds += 1
        } else {
            seconds -= 1
        }
        timerLabel.text = String(seconds)
    }
    
}

