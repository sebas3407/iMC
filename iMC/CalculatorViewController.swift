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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
           //
        default:
            if let aux = Double(txtCentimeters.text!) {
                let total = aux + 1
                txtCentimeters.text = String(total)
            }        }
    }
    
    @IBAction func decreaseValue(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
