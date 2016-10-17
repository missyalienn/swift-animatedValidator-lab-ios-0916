//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    var fieldCounter: Int = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.submitButton.isEnabled = false
    }

    
    
    
    @IBAction func emailEditEnded(_ sender: AnyObject) {
        
        if (emailTextField.text?.contains("@"))! && (emailTextField.text?.contains("."))! {
              print("Valid email")
              fieldCounter += 1
             self.emailTextField.backgroundColor = UIColor.green
            submitButtonMove()
        }else{
           print("Invalid email")
        UIView.animate(withDuration: 0.4, delay: 0.0, options: [UIViewAnimationOptions.curveLinear,UIViewAnimationOptions.autoreverse], animations: { self.emailTextField.backgroundColor = UIColor.red },
            completion: nil)
            
        
            
            
    }
}
    
    @IBAction func confirmEmailEditEnded(_ sender: AnyObject) {
        
        if emailConfirmationTextField.text == emailTextField.text {
            print("Valid.")
            fieldCounter += 1
            self.emailConfirmationTextField.backgroundColor = UIColor.green
            submitButtonMove()
        } else {
            print("Your emails don't match.")
            UIView.animate(withDuration: 0.4, delay: 0.0, options: [UIViewAnimationOptions.curveLinear,UIViewAnimationOptions.autoreverse], animations: { self.emailConfirmationTextField.backgroundColor = UIColor.red },
                           completion: nil)
        }
    }
    
    
    
    @IBAction func phoneEditEnded(_ sender: AnyObject) {
        
     let phoneNumber = phoneTextField.text
        
        if Int(phoneNumber!) != nil && ((phoneTextField.text?.characters.count)! >= 7) {
            print("Valid number")
            fieldCounter += 1
            self.phoneTextField.backgroundColor = UIColor.green
            submitButtonMove()
        } else {
            print ("Not valid number. Try again.")
            UIView.animate(withDuration: 0.4, delay: 0.0, options: [UIViewAnimationOptions.curveLinear,UIViewAnimationOptions.autoreverse], animations: { self.phoneTextField.backgroundColor = UIColor.red },
                           completion: nil)
        }
        
    }
    

    
    @IBAction func passwordEditEnded(_ sender: AnyObject) {
        
        if (passwordTextField.text?.characters.count)! >= 6 {
            print("Valid password")
            fieldCounter += 1
            self.passwordTextField.backgroundColor = UIColor.green
            submitButtonMove()
        } else {
            print("Invalid. Password must be at least 6 characters.")
            UIView.animate(withDuration: 0.4, delay: 0.0, options: [UIViewAnimationOptions.curveLinear,UIViewAnimationOptions.autoreverse], animations: { self.passwordTextField.backgroundColor = UIColor.red },
                           completion: nil)
            
        }
    }
    
    
    
    @IBAction func confirmPasswordEditEnded(_ sender: AnyObject) {
        
        if (passwordConfirmTextField.text == passwordTextField.text) {
            print("Passwords match")
            fieldCounter += 1
            self.passwordConfirmTextField.backgroundColor = UIColor.green
            submitButtonMove()
        } else {
            print("Passwords don't match")
            UIView.animate(withDuration: 0.4, delay: 0.0, options: [UIViewAnimationOptions.curveLinear,UIViewAnimationOptions.autoreverse], animations: { self.passwordConfirmTextField.backgroundColor = UIColor.red },
            completion: nil)
            
        }
        
    }
    
    
    func submitButtonMove() {
        
        if fieldCounter >= 5 {
            submitButton.isEnabled = true
        }
        
        UIView.animate(withDuration: 0.4, animations: {
            
            self.submitButton.frame.origin.y = -250
        })
    
        
    }
    
        
        
}

   
        
    
    
    
    
    
    
    

