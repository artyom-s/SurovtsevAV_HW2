//
//  ViewController.swift
//  SurovtsevAV_HW2
//
//  Created by Артем on 26/07/2019.
//  Copyright © 2019 Артем. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorBoardMain: UIView!
    @IBOutlet var colorBoardRed: UIView!
    @IBOutlet var colorBoardGreen: UIView!
    @IBOutlet var colorBoardBlue: UIView!
    @IBOutlet var colorBoardGrey: UIView!
    
    @IBOutlet var colorRedValue: UILabel!
    @IBOutlet var colorGreenValue: UILabel!
    @IBOutlet var colorBlueValue: UILabel!
    
    @IBOutlet var sliderColorRed: UISlider!
    @IBOutlet var sliderColorGreen: UISlider!
    @IBOutlet var sliderColorBlue: UISlider!
    
    @IBOutlet var saveAndRestoreColorButton: UIButton!
    @IBOutlet var manualPeekLabel: UILabel!
    @IBOutlet var manualPeekSwitch: UISwitch!
    
    @IBOutlet var redTF: UILabel!
    @IBOutlet var greenTF: UILabel!
    @IBOutlet var blueTF: UILabel!
    
    @IBOutlet var manualRedTF: UITextField!
    @IBOutlet var manualGreenTF: UITextField!
    @IBOutlet var manualBlueTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
// ColorBoards visual setup
    
        colorBoardMain.backgroundColor = .black
        colorBoardMain.layer.cornerRadius = 25
        colorBoardRed.layer.cornerRadius = 25
        colorBoardGreen.layer.cornerRadius = 25
        colorBoardBlue.layer.cornerRadius = 25
        colorBoardGrey.layer.cornerRadius = 25
        saveAndRestoreColorButton.layer.cornerRadius = 25
        
        
// Sliders visual setup
        
        sliderColorRed.value = 1
        sliderColorRed.minimumValue = 1
        sliderColorRed.maximumValue = 10
        sliderColorRed.minimumTrackTintColor = .red
        sliderColorRed.thumbTintColor = .red
        
        sliderColorGreen.value = 0
        sliderColorGreen.minimumValue = 0
        sliderColorGreen.maximumValue = 10
        sliderColorGreen.minimumTrackTintColor = .green
        sliderColorGreen.thumbTintColor = .green
        
        sliderColorBlue.value = 0
        sliderColorBlue.minimumValue = 0
        sliderColorBlue.maximumValue = 10
        sliderColorBlue.minimumTrackTintColor = .blue
        sliderColorBlue.thumbTintColor = .blue
        
// Hide manual text fielsd
        
        manualRedTF.isHidden = true
        manualGreenTF.isHidden = true
        manualBlueTF.isHidden = true

    }
    
// Slider values in valuesCount
    
    @IBAction func sliderRedAction() {
        colorRedValue.text = String (format: "%.0f", sliderColorRed.value)
        colorBoardMain.backgroundColor = UIColor(
            red: CGFloat (sliderColorRed.value) * 25.5 / 255,
            green: CGFloat (sliderColorGreen.value) * 25.5 / 255,
            blue: CGFloat (sliderColorBlue.value) * 25.5 / 255,
            alpha: 1.0
        )
    }
    @IBAction func sliderGreenAction() {
        colorGreenValue.text = String (format: "%.0f", sliderColorGreen.value)
        colorBoardMain.backgroundColor = UIColor(
            red: CGFloat (sliderColorRed.value) * 25.5 / 255,
            green: CGFloat (sliderColorGreen.value) * 25.5 / 255,
            blue: CGFloat (sliderColorBlue.value) * 25.5 / 255,
            alpha: 1.0
        )
    }
    @IBAction func sliderBlueAction() {
        colorBlueValue.text = String (format: "%.0f", sliderColorBlue.value)
        colorBoardMain.backgroundColor = UIColor(
            red: CGFloat (sliderColorRed.value) * 25.5 / 255,
            green: CGFloat (sliderColorGreen.value) * 25.5 / 255,
            blue: CGFloat (sliderColorBlue.value) * 25.5 / 255,
            alpha: 1.0
        )
    }
    
// Save and restore color
    
    @IBAction func saveAndRestoreColor() {
        
        if  saveAndRestoreColorButton.currentTitle == "SAVE COLOR" {
            saveAndRestoreColorButton.setTitle("RESTORE COLOR", for: .normal)
            saveAndRestoreColorButton.backgroundColor = UIColor(
                red: CGFloat (sliderColorRed.value) * 25.5 / 255,
                green: CGFloat (sliderColorGreen.value) * 25.5 / 255,
                blue: CGFloat (sliderColorBlue.value) * 25.5 / 255,
                alpha: 1.0
            )
        } else {
            colorBoardMain.backgroundColor = saveAndRestoreColorButton.backgroundColor
            sliderColorRed.value = 0
            sliderColorGreen.value = 0
            sliderColorBlue.value = 0
            colorRedValue.text = "0"
            colorGreenValue.text = "0"
            colorBlueValue.text = "0"
            saveAndRestoreColorButton.setTitle("SAVE COLOR", for: .normal)
            saveAndRestoreColorButton.backgroundColor = UIColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 1.0)
        }
    }


// Manual peek
    
    
    
    
// Manual peek button
    
    @IBAction func manualPeekOnOff() {
        colorRedValue.isHidden.toggle()
        colorBlueValue.isHidden.toggle()
        colorGreenValue.isHidden.toggle()
        sliderColorRed.isHidden.toggle()
        sliderColorGreen.isHidden.toggle()
        sliderColorBlue.isHidden.toggle()
        manualRedTF.isHidden.toggle()
        manualGreenTF.isHidden.toggle()
        manualBlueTF.isHidden.toggle()
        redTF.text = manualPeekSwitch.isOn ? "RED" : "R"
        greenTF.text = manualPeekSwitch.isOn ? "GREEN" : "G"
        blueTF.text = manualPeekSwitch.isOn ? "BLUE" : "B"
        manualPeekLabel.text = manualPeekSwitch.isOn ? "MANUAL PEEK ON" : "MANUAL PEEK OFF"
    }
    
}



