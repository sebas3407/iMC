//
//  CalculatorViewController.swift
//  iMC
//
//  Created by Sebastian Ortiz Velez on 23/03/2019.
//  Copyright © 2019 Sebastian Ortiz Velez. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var txtCentimeters: UITextField!
    @IBOutlet weak var txtKilograms: UITextField!
    @IBOutlet weak var txtGoal: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    
    enum Gender {
        case male, female
    }
    
    var centimeters : Double = 0
    var kilograms : Double = 0
    var age : Int = 0
    var gender : Gender = .male
    var result : Double = 0
    var ibm : String = ""
    var idealIbm : String = ""
    var goal : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func increaseValue(_ sender: Any) {
        
        let btn : UIButton = sender as! UIButton
        let accessibilityLabel = (btn.accessibilityLabel!)
        
        switch accessibilityLabel {
        case "cmplus":
            if (txtCentimeters.text == ""){
                txtCentimeters.text = "1"
                return
            }
            
            if let aux = Double(txtCentimeters.text!) {
                let total = aux + 1
                txtCentimeters.text = String(total)
            }
            
        case "agePlus":
            if (txtAge.text == ""){
                txtAge.text = "1"
                return
            }
            
            if let aux = Double(txtAge.text!) {
                let total = aux + 1
                txtAge.text = String(total)
            }
            
        case "kilogramsPlus":
            if (txtKilograms.text == ""){
                txtKilograms.text = "1"
                return
            }
            
            if let aux = Double(txtKilograms.text!) {
                let total = aux + 1
                txtKilograms.text = String(total)
            }
            
        case "goalPlus":
            if (txtGoal.text == ""){
                txtGoal.text = "1"
                return
            }
            
            if let aux = Double(txtGoal.text!) {
                let total = aux + 1
                txtGoal.text = String(total)
            }
        default:
            return
        }
    }
    
    @IBAction func decreaseValue(_ sender: Any) {
        
        let btn : UIButton = sender as! UIButton
        let accessibilityLabel = (btn.accessibilityLabel!)
        
        switch accessibilityLabel {
        case "cmMinus":
            if (txtCentimeters.text == ""){
                txtCentimeters.text = "1"
                return
            }
            
            if let aux = Double(txtCentimeters.text!) {
                let total = aux - 1
                if(total > 0){
                    txtCentimeters.text = String(total)
                }
            }
            
        case "kilogramsMinus":
            if (txtKilograms.text == ""){
                txtKilograms.text = "1"
                return
            }
            
            if let aux = Double(txtKilograms.text!) {
                let total = aux - 1
                if(total > 0){
                    txtKilograms.text = String(total)
                }
            }
            
        case "ageMinus":
            if (txtAge.text == ""){
                txtAge.text = "1"
                return
            }
            
            if let aux = Double(txtAge.text!) {
                let total = aux - 1
                if(total > 0){
                    txtAge.text = String(total)
                }
            }
            
        case "goalMinus":
            if (txtGoal.text == ""){
                txtGoal.text = "1"
                return
            }
            
            if let aux = Double(txtGoal.text!) {
                let total = aux + 1
                if(total > 0){
                    txtGoal.text = String(total)
                }
            }
        default:
            return
        }
    }
    
    @IBAction func setGender(_ sender: Any) {
        
        let btn : UIButton = sender as! UIButton
        let accessibilityLabel = (btn.accessibilityLabel!)
        
        if(accessibilityLabel == ""){
            gender = .male
        }
        else{
            gender = .female
        }
    }
    
    func calculation(){
        
        let meters : Double = centimeters / 100
        result = kilograms /  (meters * meters)
        
        switch result {
        case 0...18.5:
            ibm = "Peso inferior a lo normal"
        case 18.5...24.9:
            ibm = "Normal"
        case  25.0...29.9:
            ibm = "Peso superior al normal"
        case 30...100:
            ibm = "Obesidad"
        default:
            ibm = "Normal"
        }
        
        if(gender == .male){
            idealIbm = ""
        }
        else{
            idealIbm = ""
        }
    }
}
