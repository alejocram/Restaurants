//
//  ViewController.swift
//  Restaurants
//
//  Created by Alejocram on 6/05/16.
//  Copyright © 2016 EAFIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var termsLabel: UILabel!
    @IBOutlet weak var generSegmented: UISegmentedControl!
    @IBOutlet weak var termsSwitch: UISwitch!

    
    var gener1:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generSegmented.selectedSegmentIndex = 1
        termsSwitch.on = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setGener(sender: AnyObject) {
        switch generSegmented.selectedSegmentIndex {
        case 0:
            gener1 = "Masculino"
        default:
            gener1 = "Femenino"
        }
    }

    @IBAction func register(sender: AnyObject) {
        if termsSwitch.on {
        
        let email = emailTextField.text
        let password = passwordTextField.text
        
        termsLabel.text = email! + password!
        } else {
            let alert = UIAlertView(title: "Registro", message: "Debes aceptar los terminos y condiciones", delegate: nil, cancelButtonTitle: "Ok")
            
            alert.show()
        }
    }

}
























