//
//  SettingsViewController.swift
//  Prework
//
//  Created by Eddie Phillips on 1/27/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    var pickerView = UIPickerView()
    
    @IBOutlet weak var lightDarkText: UILabel!
    @IBOutlet weak var groupSizeText: UILabel!
    @IBOutlet weak var currencyText: UILabel!
    @IBOutlet weak var currencyPicker: UITextField!
    @IBOutlet weak var groupStepperOutlet: UIStepper!
    @IBOutlet weak var groupSizeLabel: UILabel!
    @IBOutlet weak var lightDarkValue: UISwitch!
    let currencies = ["USD", "ETH", "BTC", "SOL", "ADA"]
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        currencyPicker.inputView = pickerView
        groupStepperOutlet.value = 1
        self.view.backgroundColor = .systemGray5
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        groupStepperOutlet.value = defaults.double(forKey: "groupsize")
        if defaults.string(forKey: "bgcolor") == "dark" {
            self.view.backgroundColor = .darkGray
            lightDarkText.textColor = .white
            groupSizeText.textColor = .white
            groupSizeLabel.textColor = .white
            currencyText.textColor = .white
        }
        else if defaults.string(forKey: "bgcolor") == "light" {
            self.view.backgroundColor = .systemGray5
            lightDarkText.textColor = .black
            groupSizeText.textColor = .black
            groupSizeLabel.textColor = .black
            currencyText.textColor = .black
        }
        if defaults.bool(forKey: "lightswitch") == true {
            lightDarkValue.isOn = true
        }
        else {
            lightDarkValue.isOn = false
        }
        groupSizeLabel.text = String(Int(defaults.integer(forKey: "groupsize")))
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        groupSizeLabel.text = String(defaults.double(forKey: "groupsize"))
    }
    
    @IBAction func lightDarkSwitch(_ sender: UISwitch) {
        lightDarkValue.isOn == true ? darkModeSwitch(true) : darkModeSwitch(false)
    }
    
    @IBAction func stepperAction(_ sender: Any) {
        groupStepperOutlet.maximumValue = 10
        groupStepperOutlet.minimumValue = 0
        groupStepperOutlet.wraps = true
        groupStepperOutlet.autorepeat = true
        groupSizeLabel.text = Int(groupStepperOutlet.value).description
        
        defaults.set(Int(groupStepperOutlet.value), forKey: "groupsize")
        defaults.synchronize()
        
    }
    
    
    func darkModeSwitch(_ darkModeOn: Bool) {
        if lightDarkValue.isOn == true {
            defaults.set("dark", forKey: "bgcolor")
            self.view.backgroundColor = .darkGray
            defaults.set(true, forKey:"lightswitch")
            lightDarkText.textColor = .white
            groupSizeText.textColor = .white
            groupSizeLabel.textColor = .white
            currencyText.textColor = .white
        }
        else if lightDarkValue.isOn == false {
            defaults.set("light", forKey: "bgcolor")
            self.view.backgroundColor = .systemGray5
            defaults.set(false, forKey:"lightswitch")
            lightDarkText.textColor = .black
            groupSizeText.textColor = .black
            groupSizeLabel.textColor = .black
            currencyText.textColor = .black
            
        }
        defaults.synchronize()
    }
}

extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencies[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currencyPicker.text = currencies[row]
        defaults.set(currencies[row], forKey: "money")
        defaults.synchronize()
        currencyPicker.resignFirstResponder()
    }
}
