//
//  MainViewController.swift
//  PriceTag
//
//  Created by George Zheng on 12/15/17.
//  Copyright © 2017 George Zheng. All rights reserved.
//
import LinkKit
import UIKit
import FirebaseAuth

class MainViewController: UITabBarController {

    @IBOutlet weak var tmpLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let user = Auth.auth().currentUser{
            tmpLabel.text = user.email
        }else{
            tmpLabel.text = "no current user"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension MainViewController : PLKPlaidLinkViewDelegate
{
    
    // <!-- SMARTDOWN_DELEGATE_SUCCESS -->
    func linkViewController(_ linkViewController: PLKPlaidLinkViewController, didSucceedWithPublicToken publicToken: String, metadata: [String : Any]?) {
        dismiss(animated: true) {
            // Handle success, e.g. by storing publicToken with your service
            NSLog("Successfully linked account!\npublicToken: \(publicToken)\nmetadata: \(metadata ?? [:])")
            
        }
    }
    
    
    // <!-- SMARTDOWN_DELEGATE_EXIT -->
    func linkViewController(_ linkViewController: PLKPlaidLinkViewController, didExitWithError error: Error?, metadata: [String : Any]?) {
        dismiss(animated: true) {
            if let error = error {
                NSLog("Failed to link account due to: \(error.localizedDescription)\nmetadata: \(metadata ?? [:])")
                
            }
            else {
                NSLog("Plaid link exited with metadata: \(metadata ?? [:])")
                
            }
        }
    }
    
    
    // <!-- SMARTDOWN_DELEGATE_EVENT -->
    func linkViewController(_ linkViewController: PLKPlaidLinkViewController, didHandleEvent event: String, metadata: [String : Any]?) {
        NSLog("Link event: \(event)\nmetadata: \(metadata)")
    }
}
