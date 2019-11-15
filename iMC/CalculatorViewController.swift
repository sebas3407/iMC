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
    @IBOutlet weak var viewMale: UIView!
    @IBOutlet weak var viewFemale: UIView!
    
    enum Gender {
        case male, female
    }
    
    struct Person {
        let centimeters: Double
        let kilograms: Double
        let age: Int
        let goal: Double
        let gender: Gender
    }
    
    var centimeters : Double = 168
    var kilograms : Double = 53
    var age : Int = 24
    var gender : Gender = .male
    var ibm : Double = 0
    var ibmDescription : String = ""
    var idealIbm : String = ""
    var goal : Double = 0
    
    let viewControllerB = ViewController()
//    navigationController?.pushViewController(viewControllerB, animated: true)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let user = Person(centimeters: self.centimeters, kilograms: self.kilograms, age: self.age, goal: self.goal, gender: self.gender)
    
        let detailViewController = segue.destination as? ViewController
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        let maleTap = UITapGestureRecognizer(target: self, action:
            #selector(setGender(sender:)))
        maleTap.accessibilityLabel = "viewMale"
        viewMale.addGestureRecognizer(maleTap)
        
        let femaleTap = UITapGestureRecognizer(target: self, action:
            #selector(setGender(sender:)))
        femaleTap.accessibilityLabel = "viewFemale"
        viewFemale.addGestureRecognizer(femaleTap)
        
       // centimeters = Double("txtCentimeters.text") as! Double
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
            
            if let aux = Int(txtAge.text!) {
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
    
    @objc func setGender(sender: UITapGestureRecognizer) {
        
        let activeColor : UIColor = UIColor.init(red: 120/255, green: 143/255, blue: 155/255, alpha: 1)
        let inactiveColor : UIColor = UIColor.init(red: 55/255, green: 68/255,blue: 78/255, alpha: 1)
        
        if(sender.accessibilityLabel == "viewMale"){
            gender = .male
            viewMale.backgroundColor = activeColor
            viewFemale.backgroundColor = inactiveColor
        }
        else{
            gender = .female
            viewFemale.backgroundColor = activeColor
            viewMale.backgroundColor = inactiveColor
        }
    }
    
    @IBAction func resetControls(_ sender: Any) {
        txtCentimeters.text = "165"
        txtKilograms.text = "70"
        txtAge.text = "18"
        txtGoal.text = "20"
    }
    
    @IBAction func calculation(_ sender: Any) {
        
        let meters : Double = centimeters / 100
        ibm = kilograms /  (meters * meters)
        
        switch ibm {
        case 0...15.9:
            ibmDescription = "Delgadez selvera"
        case 16.0...16.9:
            ibmDescription = "Delgadez moderada"
        case 17.0...18.4:
            ibmDescription = "Delgadez leve"
        case 18.5...24.9:
            ibmDescription = "Peso normal"
        case 25.0...29.9:
            ibmDescription = "Pre-obeso"
        case 30.0...34.9:
            ibmDescription = "Obesidad tipo I"
        case 35.0...39.9:
            ibmDescription = "Obesidad tipo II"
        default:
            ibmDescription = "Obesidad tipo III"
        }
        
        switch age {
        case 16:
            idealIbm = "19 - 24"
            
        case 17...18:
            if(gender == .male){
                idealIbm = "20 - 25"
            }
            else{
                idealIbm = "19 - 24"
            }
            
        case 19...24:
            if(gender == .male){
                idealIbm = "21 - 26"
            }
            else{
                idealIbm = "19 - 24"
            }
            
        case 25...34:
            if(gender == .male){
                idealIbm = "22 - 27"
            }
            else{
                idealIbm = "20 - 25"
            }
            
        case 35...44:
            if(gender == .male){
                idealIbm = "23 - 28"
            }
            else{
                idealIbm = "21 - 26"
            }
            
        case 45...54:
            if(gender == .male){
                idealIbm = "23 - 28"
            }
            else{
                idealIbm = "22 - 27"
            }
            
        case 55...64:
            if(gender == .male){
                idealIbm = "24 - 29"
            }
            else{
                idealIbm = "23 - 28"
            }
            
        case 65...90:
            idealIbm = "20 - 25"
            
        default:
            idealIbm = "0"
        }
        
        print(idealIbm)
    }
}
