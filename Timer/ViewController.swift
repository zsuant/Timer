//
//  ViewController.swift
//  Timer
//
//  Created by 이수겸 on 2022/09/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    
    var number = 30
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.maximumValue = 60
        slider.minimumValue = 0
        slider.value = 30

    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        

        number = Int(slider.value)
        mainLabel.text = "\(number)초"
        
        
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerStart), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerStart() {
            
        if number > 0 {
            number -= 1
            slider.value = Float(number)
            mainLabel.text = "\(number)초 "

        } else {
            number = 0
            mainLabel.text = "초를 선택하세요"
            timer?.invalidate()
            AudioServicesPlayAlertSound(SystemSoundID(1322))
            
        }

    }
    
    


    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        mainLabel.text = "초를 선택하세요"
        slider.value = 30
        number = 0
        timer?.invalidate()
    }
    
    

}

