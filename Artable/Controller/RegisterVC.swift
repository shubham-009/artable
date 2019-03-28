//
//  RegisterVC.swift
//  Artable
//
//  Created by Lokesh Dwivedi on 28/03/19.
//  Copyright © 2019 Shubhamkumar. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    @IBOutlet weak var registerlbl: UILabel!
    @IBOutlet weak var usernametxtfld: UITextField!
    @IBOutlet weak var emailtxtfld: UITextField!
   
    @IBOutlet weak var passwordtxtfld: UITextField!
    @IBOutlet weak var confirmpwdtxtfld: UITextField!
    @IBOutlet weak var submitbtn: UIButton!
    
    @IBOutlet weak var confirmpwdcheck: UIImageView!
    @IBOutlet weak var passwordcheck: UIImageView!
    @IBOutlet weak var spinnerdialog: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordtxtfld.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
         confirmpwdtxtfld.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
    
    }
    
    @objc func textFieldDidChange(_ textField: UITextField){
        guard let passText = passwordtxtfld.text else { return }
        
        if textField == confirmpwdtxtfld{
            confirmpwdcheck.isHidden = false
            passwordcheck.isHidden = false
        }else{
            if passText.isEmpty{
                confirmpwdcheck.isHidden = true
                passwordcheck.isHidden = true
                confirmpwdtxtfld.text = ""
            }
        }
        if passwordtxtfld.text == confirmpwdtxtfld.text{
            passwordcheck.image = UIImage(named: AppImages.GreenCheck)
            confirmpwdcheck.image = UIImage(named: AppImages.GreenCheck)
            
        }else{
            passwordcheck.image = UIImage(named: AppImages.RedCheck)
            confirmpwdcheck.image = UIImage(named: AppImages.RedCheck)
        }
        
        
    }
    
    

    @IBAction func registerpressed(_ sender: UIButton) {
        
        guard let email = emailtxtfld.text , email.isNotEmpty ,
              let username = usernametxtfld.text , username.isNotEmpty ,
            let password = passwordtxtfld.text , password.isNotEmpty else { return }
      
        spinnerdialog.startAnimating()
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            
            if let error = error {
                debugPrint(error)
                return
            }
            self.spinnerdialog.stopAnimating()
            print("Successfully registered new user")
        }
    }
    
}
