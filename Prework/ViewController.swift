//
//  ViewController.swift
//  Prework
//
//  Created by Edmond Phillips on 1/8/22.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    var text: String?
    var tipOne: Double? = 0.15
    var tipTwo: Double? = 0.18
    var tipThree: Double? = 0.20
    let defaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        billAmountTextField.delegate = self
        billAmountTextField.keyboardType = .numberPad
        billAmountTextField.keyboardAppearance = .light
        
        if let value = defaults.value(forKey: "bill") as? String {
            billAmountTextField.text = value
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [tipOne ?? 0.15, tipTwo ?? 0.18, tipThree ?? 0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip

        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func textFieldShouldReturn(_ textfield: UITextField) -> Bool {
        defaults.setValue(billAmountTextField.text, forKey: "bill")
        billAmountTextField.resignFirstResponder()
        return true
    }
    @IBAction func textFieldAction(_ sender: Any) {
        billAmountTextField.becomeFirstResponder()
    }
}
