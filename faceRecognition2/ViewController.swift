//
//  ViewController.swift
//  faceRecognition2
//
//  Created by Doğukan Ahi on 20.07.2023.
//

import UIKit
import LocalAuthentication
class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        let authContext = LAContext()
        
        var error : NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error ){
            
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "is it you?") { (success, error) in
                
                if success == true {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "2ndVC", sender: nil)
                    }
                    
                    
                }
                else{
                    DispatchQueue.main.async {
                        self.myLabel.text = "ERROR OCCURED!!"
                    }
                    
                }
            }
            
            
            
        }
    }
 
    
    
}
