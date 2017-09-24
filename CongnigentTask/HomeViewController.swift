//
//  HomeViewController.swift
//  CongnigentTask
//
//  Created by vmoksha mobility on 21/09/17.
//  Copyright © 2017 saurabh suman. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper




class HomeViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var containerView: UIView!
    fileprivate  var extraFieldSetFields:ExtraFieldSetFields!
    fileprivate var pickerData:Array = ["--None--","None","Physician","Pharmacist","Nurse Practitioner","Nurse","Dentist","Physician Assistant","Other Healthcare Professional","Audiologist","Biomedical Engineer","Administrator/Supervisor","Other Healthcare"]
    fileprivate var mainModel : MainModel?
    fileprivate var yyPos = 20;
    
    
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
       self.readDataFromJsonString() 
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuButtonAction(_ sender: Any) {
    
    
    
    
    }
    @IBAction func gestureIsTapped(_ sender: Any) {
        
        view.endEditing(true)
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
extension HomeViewController {
    
    fileprivate func setup() {
        navigationController?.navigationBar.barTintColor = UIColor.colorWithHex(0x246E98)
      self.title = "Home"
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    
    
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWasShown(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    
    }
    
    fileprivate func readDataFromJsonString(){
        
        guard let urlpath = Bundle.main.path(forResource: "Data", ofType: ".json")
            else {
                return
        }
        let url = NSURL.fileURL(withPath: urlpath)
        Alamofire.request(url).responseObject { (response: DataResponse<MainModel>) in
            self.mainModel = response.result.value

            }.responseString { (str) in
              //  print(str)
       
                self.CreateDynamicUserInterface(mainModel: self.mainModel!)
        }
   
    

    }
    
    
    
    
    
    
    
    
    fileprivate func CreateDynamicUserInterface(mainModel:MainModel){
        
        
        let dataModel = mainModel.IncidentType
        let callerInfo = dataModel?.callerInfo
        let extraFieldSet = dataModel?.extraFields
        let intrectionType = dataModel?.interactonTypes
        
        for index in intrectionType!
        {
            if index.isVisible == "true" {
                
                let textField = DynamicUI.createUITextField()
                textField.placeholder = index.fieldName
                self.containerView.addSubview(textField)
                
                if index.fieldType == "PICKLIST"{
                    textField.delegate = self
                }
                
                AutoLayoutHelper.addTopSpaceConstraintToView(textField, topSpace: CGFloat(yyPos))
                AutoLayoutHelper.addHeightConstraintToView(textField, value: 44)
                AutoLayoutHelper.addLeadingSpaceConstraintToView(textField, leadingSpace:30)
                AutoLayoutHelper.addTrailingSpaceConstraintToView(textField, trailingSpace: 30)
                textField.translatesAutoresizingMaskIntoConstraints = false
                yyPos += 50
            }
        }
        
        yyPos += 50

        for index in callerInfo!
        {
        if index.isVisible == "true" {
                let textField = DynamicUI.createUITextField()
                textField.placeholder = index.fieldName
                self.containerView.addSubview(textField)
            if index.fieldType == "PICKLIST"{
                textField.delegate = self
            }
                AutoLayoutHelper.addTopSpaceConstraintToView(textField, topSpace: CGFloat(yyPos))
                AutoLayoutHelper.addHeightConstraintToView(textField, value: 44)
                AutoLayoutHelper.addLeadingSpaceConstraintToView(textField, leadingSpace:30)
                AutoLayoutHelper.addTrailingSpaceConstraintToView(textField, trailingSpace: 30)
               textField.translatesAutoresizingMaskIntoConstraints = false
               yyPos += 50
            }
    
        }
        yyPos += 50
        for index in extraFieldSet!{
            if index.isVisible == "true"{
                
                let textField = DynamicUI.createUITextField()
                textField.placeholder = index.fieldName
                self.containerView.addSubview(textField)
                if index.fieldType == "PICKLIST"{
                    textField.delegate = self
                }
                AutoLayoutHelper.addTopSpaceConstraintToView(textField, topSpace: CGFloat(yyPos))
                AutoLayoutHelper.addHeightConstraintToView(textField, value: 44)
                AutoLayoutHelper.addLeadingSpaceConstraintToView(textField, leadingSpace:30)
                AutoLayoutHelper.addTrailingSpaceConstraintToView(textField, trailingSpace: 30)
                textField.translatesAutoresizingMaskIntoConstraints = false
                yyPos += 50
            }
        }
        
        let textField = DynamicUI.createUITextField()
        self.containerView.addSubview(textField)
        AutoLayoutHelper.addTopSpaceConstraintToView(textField, topSpace: CGFloat(yyPos))
        AutoLayoutHelper.addHeightConstraintToView(textField, value: 0)
        AutoLayoutHelper.addLeadingSpaceConstraintToView(textField, leadingSpace:30)
        AutoLayoutHelper.addTrailingSpaceConstraintToView(textField, trailingSpace: 30)
        AutoLayoutHelper.addBottomSpaceConstraintToView(textField, bottomSpace: 0)
        textField.translatesAutoresizingMaskIntoConstraints = false

}

}

//MARK:- TextField delegate methods
extension HomeViewController:UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.topRightMenu(sender: textField)
    }
    
    
}



//MARK:- KeyBoard delegate methods
extension HomeViewController {
    
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

//MARK:- PopviewController delegate methods

extension HomeViewController:UIPopoverPresentationControllerDelegate
{
    
  fileprivate  func topRightMenu(sender:UIView)  {
        // get a reference to the view controller for the popover
        let popController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "pickerViewController")as! PickListViewController
        popController.modalPresentationStyle = UIModalPresentationStyle.popover
        popController.popoverPresentationController?.delegate = self
        popController.view.clipsToBounds = false
        popController.popoverPresentationController?.sourceView = sender
        popController.popoverPresentationController?.sourceRect = (sender as AnyObject).bounds
        let size = CGSize(width: 250, height: 200)
        popController.preferredContentSize = size
        self.present(popController, animated: true, completion: nil)
    }
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        // return UIModalPresentationStyle.FullScreen
        return UIModalPresentationStyle.none
    }
    
    
}




