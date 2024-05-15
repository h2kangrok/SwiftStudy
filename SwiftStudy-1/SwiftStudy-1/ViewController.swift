//
//  ViewController.swift
//  SwiftStudy-1
//
//  Created by 윤강록 on 2023/09/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!

    @IBOutlet weak var timerLabel: UILabel!

    @IBOutlet weak var pauseButton: UIButton!

    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var resetLabel: UILabel!
    var timer : Timer?
    var count :Float = 0.0 // 타이머 초기화?


    override func viewDidLoad() {
        super.viewDidLoad()

        playButton.addTarget(self, action: #selector(playTapped), for: .touchUpInside)
        pauseButton.addTarget(self, action: #selector(pauseTapped), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(resetLabelTapped))
        resetLabel.isUserInteractionEnabled = true 
        resetLabel.addGestureRecognizer(tapGesture)

    }

    @objc func playTapped() {
                 
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        playButton.isEnabled = false
        pauseButton.isEnabled = true
    }

    @objc func updateTimer() {
        count += 0.1
        timerLabel.text = String(format: "%.1f", count)
    }
    
    @objc func pauseTapped() {
        timer?.invalidate()
        timer = nil
        playButton.isEnabled = true
        pauseButton.isEnabled = false
    }
 
    @objc func resetTapped() {
        timer?.invalidate()
        timer = nil
        count = 0.0
        timerLabel.text = "0.0"
        playButton.isEnabled = true
        pauseButton.isEnabled = true
    }
    @objc func resetLabelTapped() {
        timer?.invalidate()
        timer = nil
        count = 0.0
        timerLabel.text = "0.0"
        playButton.isEnabled = true
        pauseButton.isEnabled = true
    }
    
    
        
    }






