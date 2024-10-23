//
//  ViewController.swift
//  EggTimer
//
//  Created by Adilkhan M on 23.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var softBoiledBtn: UIButton!
    @IBOutlet weak var medBoiledBtn: UIButton!
    @IBOutlet weak var hardBoiledBtn: UIButton!
    
    @IBAction func softBoiledBtnPressed(_ sender: Any) {
        if !isStarted{
            selectedType[2] = false
            selectedType[1] = false
            selectedType[0] = true
            setHighligthingForButtons()
            refreshTimer()
        }
    }
    
    @IBAction func medBoiledBtnPressed(_ sender: Any) {
        if !isStarted{
            selectedType[2] = false
            selectedType[1] = true
            selectedType[0] = false
            setHighligthingForButtons()
            refreshTimer()
        }
    }
    
    @IBAction func hardBoiledBtnPressed(_ sender: Any) {
        if !isStarted{
            selectedType[2] = true
            selectedType[1] = false
            selectedType[0] = false
            setHighligthingForButtons()
            refreshTimer()
        }
        
    }
    
    @IBOutlet weak var startBtn: UIButton!
    
    @IBAction func startBtnPressed(_ sender: Any) {
        if !isStarted{
            counter = getCurrentTimer()
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timerAction), userInfo: nil, repeats: true)
            startBtn.setImage(UIImage(named: "stop"), for: .normal)
            isStarted = true
        }else{
            isStarted = false
            timer.invalidate()
            refreshTimer()
            enableButtons()
            setHighligthingForButtons()
            startBtn.setImage(UIImage(named: "start"), for: .normal)
        }
    }
    
    @objc func timerAction(){
        counter! -= 1
        if counter! < 0{
            timerLabel.text = "Ready!"
        }else{
            timerLabel.text = NSString(format: "%0.2d:%0.2d", counter!/60, counter!%60) as String
        }
    }
    
    func refreshTimer(){
        counter = getCurrentTimer()
        timerLabel.text = NSString(format: "%0.2d:%0.2d", counter!/60, counter!%60) as String
    }
    
    func disableButtons(){
        softBoiledBtn.isEnabled = false
        medBoiledBtn.isEnabled = false
        hardBoiledBtn.isEnabled = false
    }
    
    func enableButtons(){
        softBoiledBtn.isEnabled = true
        medBoiledBtn.isEnabled = true
        hardBoiledBtn.isEnabled = true
    }
    
    @IBOutlet weak var timerLabel: UILabel!
    
    let softBoiledConst = 300
    let medBoiledConst = 420
    let hardBoiledConst = 720
    
    var selectedType = Array(repeating: false, count: 3)
    var timer = Timer()
    var isStarted = false
    var counter : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        softBoiledBtn.isHighlighted = true
        medBoiledBtn.isHighlighted = true
        selectedType[2] = true
        timerLabel.text = NSString(format: "%0.2d:%0.2d", hardBoiledConst/60, hardBoiledConst%60) as String
    }
    
    func getCurrentTimer() -> Int{
        if selectedType[0]{
            return softBoiledConst
        }else if selectedType[1]{
            return medBoiledConst
        }else{
            return hardBoiledConst
        }
    }
    
    func setHighligthingForButtons(){
        if selectedType[0]{
            softBoiledBtn.isHighlighted = false
            medBoiledBtn.isHighlighted = true
            hardBoiledBtn.isHighlighted = true
        }else if selectedType[1]{
            softBoiledBtn.isHighlighted = true
            medBoiledBtn.isHighlighted = false
            hardBoiledBtn.isHighlighted = true
        }else if selectedType[1]{
            softBoiledBtn.isHighlighted = true
            medBoiledBtn.isHighlighted = true
            hardBoiledBtn.isHighlighted = false
        }
        
        
    }
    
}
