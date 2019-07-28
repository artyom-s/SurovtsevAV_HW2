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
    @IBOutlet var manualPickLabel: UILabel!
    @IBOutlet var manualPickSwitch: UISwitch!
  
    @IBOutlet var redTF: UILabel!
    @IBOutlet var greenTF: UILabel!
    @IBOutlet var blueTF: UILabel!
    
    @IBOutlet var manualRedTF: UITextField!
    @IBOutlet var manualGreenTF: UITextField!
    @IBOutlet var manualBlueTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
// Add Done Button for text fields
        
        manualRedTF.addDoneButtonKeyboard()
        manualGreenTF.addDoneButtonKeyboard()
        manualBlueTF.addDoneButtonKeyboard()
        
        
// ColorBoards visual setup
    
        colorBoardMain.backgroundColor = .black
        colorBoardMain.layer.cornerRadius = 25
        colorBoardRed.layer.cornerRadius = 25
        colorBoardGreen.layer.cornerRadius = 25
        colorBoardBlue.layer.cornerRadius = 25
        colorBoardGrey.layer.cornerRadius = 25
        saveAndRestoreColorButton.layer.cornerRadius = 25
        
        
// Sliders visual setup
        
        sliderColorRed.value = 0
        sliderColorRed.minimumValue = 0
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
    
// Change color by sliders
    
    @IBAction func sliderRedAction() {
        colorRedValue.text = String (format: "%.0f", sliderColorRed.value)
        manualRedTF.text = colorRedValue.text
        changeMainColor()
    }
    @IBAction func sliderGreenAction() {
        colorGreenValue.text = String (format: "%.0f", sliderColorGreen.value)
        manualGreenTF.text = colorGreenValue.text
        changeMainColor()
    }
    @IBAction func sliderBlueAction() {
        colorBlueValue.text = String (format: "%.0f", sliderColorBlue.value)
        manualBlueTF.text = colorBlueValue.text
        changeMainColor()
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
            manualRedTF.text = "0"
            manualGreenTF.text = "0"
            manualBlueTF.text = "0"
            
            saveAndRestoreColorButton.setTitle("SAVE COLOR", for: .normal)
            saveAndRestoreColorButton.backgroundColor = UIColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 1.0)
        }
    }

// Manual change color
    
    @IBAction func manualRedTFEntering() {
        
        colorRedValue.text = manualRedTF.text
        sliderColorRed.value = (manualRedTF.text! as NSString).floatValue
    
        guard let inputTextR = manualRedTF.text, !inputTextR.isEmpty else {
                    manualRedTF.text = "0";
                    colorRedValue.text = "0";
                    sliderColorRed.value = 0;
                    changeMainColor();
                    return
                    }
        
        let range = 0...10
        if range.contains(Int(inputTextR)!) {
            changeMainColor()
        } else {
            showAlert(title: "ERROR", message: "Please, enter value between 0 and 10")
            manualRedTF.text = "0"
            colorRedValue.text = "0"
            sliderColorRed.value = 0
            changeMainColor()
        }
    }
  
    
    @IBAction func manualGreenTFEntering() {
        colorGreenValue.text = manualGreenTF.text
        sliderColorGreen.value = (manualGreenTF.text! as NSString).floatValue
        
        guard let inputTextG = manualGreenTF.text, !inputTextG.isEmpty else {
            manualGreenTF.text = "0";
            colorGreenValue.text = "0";
            sliderColorGreen.value = 0;
            changeMainColor();
            return
        }
        
        let range = 0...10
        if range.contains(Int(inputTextG)!) {
            changeMainColor()
        } else {
            showAlert(title: "ERROR", message: "Please, enter value between 0 and 10")
            manualGreenTF.text = "0"
            colorGreenValue.text = "0"
            sliderColorGreen.value = 0
            changeMainColor()
        }
    }

    @IBAction func manualBlueTFEntering() {
        colorBlueValue.text = manualBlueTF.text
        sliderColorBlue.value = (manualBlueTF.text! as NSString).floatValue
        
        guard let inputTextB = manualBlueTF.text, !inputTextB.isEmpty else {
            manualBlueTF.text = "0";
            colorBlueValue.text = "0";
            sliderColorBlue.value = 0;
            changeMainColor();
            return
        }
        let range = 0...10
        if range.contains(Int(inputTextB)!) {
            changeMainColor()
        } else {
            showAlert(title: "ERROR", message: "Please, enter value between 0 and 10")
            manualBlueTF.text = "0"
            colorBlueValue.text = "0"
            sliderColorBlue.value = 0
            changeMainColor()
        }
    }

// Manual-sliders switch
    
    @IBAction func manualPickOnOff () {
    
        colorRedValue.isHidden.toggle()
        colorBlueValue.isHidden.toggle()
        colorGreenValue.isHidden.toggle()
        sliderColorRed.isHidden.toggle()
        sliderColorGreen.isHidden.toggle()
        sliderColorBlue.isHidden.toggle()
        manualRedTF.isHidden.toggle()
        manualGreenTF.isHidden.toggle()
        manualBlueTF.isHidden.toggle()
        redTF.text = manualPickSwitch.isOn ? "RED" : "R"
        greenTF.text = manualPickSwitch.isOn ? "GREEN" : "G"
        blueTF.text = manualPickSwitch.isOn ? "BLUE" : "B"
        manualPickLabel.text = manualPickSwitch.isOn ? "MANUAL PICK ON" : "MANUAL PICK OFF"
    }
    
}
extension ViewController {
    func changeMainColor() {
        colorBoardMain.backgroundColor = UIColor(
            red: CGFloat (sliderColorRed.value) * 25.5 / 255,
            green: CGFloat (sliderColorGreen.value) * 25.5 / 255,
            blue: CGFloat (sliderColorBlue.value) * 25.5 / 255,
            alpha: 1.0
            )
    }
}

// Alert control

extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

// Hide Keyboard

extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
    }
}

// Button Done on keyboard

extension UITextField {
    @IBInspectable var doneAccessory: Bool {
        get {
            return self.doneAccessory
        }
        set (hasDone) {
             addDoneButtonKeyboard()
        }
    }
    
    func addDoneButtonKeyboard() {
        
        let doneToolBar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolBar.barStyle = .default
        
        let flexSpace = UIBarButtonItem (barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done:UIBarButtonItem = UIBarButtonItem (title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace,done]
        doneToolBar.items = items
        doneToolBar.sizeToFit()
        
        self.inputAccessoryView = doneToolBar
    }
    
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
}



