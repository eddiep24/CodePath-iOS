//
//  ViewController.swift
//  Prework
//
//  Created by Eddie Phillips on 1/27/22.
//

import UIKit

class ViewController: UIViewController {

    
    let defaults = UserDefaults.standard
    

    @IBOutlet weak var tipLabel: UILabel!

    @IBOutlet weak var billAmountText: UILabel!
    @IBOutlet weak var groupSize: UILabel!
    @IBOutlet weak var groupSizeLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalField: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        
        billAmountTextField.keyboardType = .numberPad
        billAmountTextField.becomeFirstResponder()
        self.view.backgroundColor = .systemGray5
        defaults.set("USD", forKey: "money")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        groupSizeLabel.text = String(defaults.integer(forKey: "groupsize"))
        if defaults.string(forKey: "bgcolor") == "dark" {
            self.view.backgroundColor = .darkGray
            totalField.textColor = .white
            groupSize.textColor = .white
            groupSizeLabel.textColor = .white
            tipAmountLabel.textColor = .white
            totalLabel.textColor = .white
            tipPercentageLabel.textColor = .white
            billAmountText.textColor = .white
            tipLabel.textColor = .white
            
        }
        else if defaults.string(forKey: "bgcolor") == "light" {
            self.view.backgroundColor = .systemGray5
            totalField.textColor = .black
            groupSize.textColor = .black
            groupSizeLabel.textColor = .black
            tipAmountLabel.textColor = .black
            totalLabel.textColor = .black
            tipPercentageLabel.textColor = .black
            billAmountText.textColor = .black
            tipLabel.textColor = .black

            
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }

    
    @IBAction func calculateTip(_ sender: Any) {
        let groupsize = defaults.double(forKey: "groupsize")
        let money = defaults.string(forKey:"money")
        let transfer = ["USD": "$",
                        "SOL": "SOL",
                        "BTC": "₿",
                        "ADA": "ADA",
                        "ETH": "ETH"]
        
        let moneyvalue = transfer[money!] ?? "$"
        
        
        if Int(groupsize) == 1 {
            let bill = Double(billAmountTextField.text!) ?? 0
            tipPercentageLabel.text = String(format: "%.1f", Double(tipSlider.value)) + "%"
            let tip = Double(tipSlider.value) * bill / 100
            let total = bill + tip
            tipAmountLabel.text =  String(format: moneyvalue + "%.2f", tip)
            totalField.text = String(format: moneyvalue + "%.2f", total)
        }
        else {
            let bill = Double(billAmountTextField.text!)! / groupsize
            tipPercentageLabel.text = String(format: "%.1f", Double(tipSlider.value)) + "%"
            let tip = Double(tipSlider.value) * bill / 100
            let total = bill + tip
            tipAmountLabel.text = String(format: "$%.2f", tip)
            totalField.text = String(format: "$%.2f", total)
        }
    }
    
    
    
}

