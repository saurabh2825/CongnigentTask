//
//  LoginViewController.swift
//  CongnigentTask
//
//  Created by vmoksha mobility on 21/09/17.
//  Copyright © 2017 saurabh suman. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController
{
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    fileprivate var scrollViewBottomInset : CGFloat! {
        
        didSet {
            
            var currentInset                = self.scrollView.contentInset
            currentInset.bottom             = scrollViewBottomInset
            self.scrollView.contentInset    = currentInset
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    

    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setup()

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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



extension LoginViewController {
    
    fileprivate func setup() {
        
        self.navigationController?.isNavigationBarHidden = true
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWasShown(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
}

//MARK:- KeyBoard delegate methods
extension LoginViewController {
        
        @objc fileprivate func keyboardWasShown(_ notification: Notification) {
            
            if let info = (notification as NSNotification).userInfo {
                
                let dictionary = info as NSDictionary
                
                let kbSize = (dictionary.object(forKey: UIKeyboardFrameBeginUserInfoKey)! as AnyObject).cgRectValue.size
                
                self.scrollViewBottomInset = kbSize.height + 10
            }
        }
        
        @objc fileprivate func keyboardWillHide(_ notification: Notification) {
            
            self.scrollViewBottomInset = 0
        }
}


