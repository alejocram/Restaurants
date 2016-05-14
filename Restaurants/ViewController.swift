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
    
    let model = UserModel()
    
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
            let gener = gener1;
            
            model.saveUser(User(username: email!, password:password!, gener:gener!), completion: { (success, response) in
                if success {
                    let defaults = NSUserDefaults.standardUserDefaults()
                    defaults.setValue(email, forKey: "username")
                    
                    NSNotificationCenter.defaultCenter().postNotificationName("setUsername", object: nil)
                } else {
                    let alert = UIAlertController(title: "Error", message: "No fue posible el registro", preferredStyle: .Alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    alert.addAction(defaultAction)
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                }
            })
        
            self.dismissViewControllerAnimated(true, completion: nil)
        } else {
            let alert = UIAlertView(title: "Registro", message: "Debes aceptar los terminos y condiciones", delegate: nil, cancelButtonTitle: "Ok")
            
            alert.show()
        }
    }

}
























