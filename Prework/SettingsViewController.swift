//
//  SettingsViewController.swift
//  Prework
//
//  Created by Edmond Phillips on 1/16/22.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tipOneField: UITextField!
    @IBOutlet weak var tipTwoField: UITextField!
    @IBOutlet weak var tipThreeField: UITextField!
    @IBOutlet weak var lightDarkSwitch: UISwitch!
//
//
    override func viewDidLoad() {
        super.viewDidLoad()
//        let controller = storyboard?.instantiateViewController(withIdentifier: "MainVC") as! ViewController
//
//        controller.tipTwo = Double(tipTwoField.text!)
//        controller.tipThree = Double(tipThreeField.text!)
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        lightDarkMode()
//    }
//
//
//
//    func lightDarkMode() {
//        if lightDarkSwitch.isOn {
//            overrideUserInterfaceStyle = UIUserInterfaceStyle.dark
//        } else {
//            overrideUserInterfaceStyle = UIUserInterfaceStyle.light
//        }
//    }
}
