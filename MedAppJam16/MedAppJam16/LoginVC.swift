//
//  LoginViewController.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/9/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if (FIRAuth.auth()?.currentUser) != nil {
            // User is signed in.
            print(FIRAuth.auth()?.currentUser?.email!)
            
            performSegue(withIdentifier: "loginSegue", sender: nil)
        } else {
            // No user is signed in.
            print("not logged in")
        }
    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        loginWithCredentials(emailAddress: emailTextField.text!, password: passwordTextField.text!)
    }
    
    func loginWithCredentials(emailAddress: String, password: String) {
        FIRAuth.auth()?.signIn(withEmail: emailAddress, password: password, completion: { (user, error) in
            if (error == nil) {
                // Log in successfully
                
                // code to segue to main screens.
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
            } else {
                // 2 possibilities. 1) account doesn't exist. 2) Account exists, password was incorrect
                FIRAuth.auth()?.createUser(withEmail: emailAddress, password: password, completion: { (user, error) in
                    if (error == nil) {
                        // Success, created account, logging in now
                        self.performSegue(withIdentifier: "loginSegue", sender: nil)
                        
                    } else {
                        let errorMessage = "Account exists but password is incorrect"
                        let alert = UIAlertController(title: emailAddress, message: errorMessage, preferredStyle: .alert)
                        let action1 = UIAlertAction.init(title: "Try Again", style: .default, handler: nil)
                        alert.addAction(action1)
                        self.present(alert, animated: true, completion: nil)
                    }
                })
            }
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
