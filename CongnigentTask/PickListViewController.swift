//
//  PickListViewController.swift
//  CongnigentTask
//
//  Created by vmoksha mobility on 24/09/17.
//  Copyright © 2017 saurabh suman. All rights reserved.
//

import UIKit

class PickListViewController: UIViewController {
fileprivate var pickerData:Array = ["--None--","None","Physician","Pharmacist","Nurse Practitioner","Nurse","Dentist","Physician Assistant","Other Healthcare Professional","Audiologist","Biomedical Engineer","Administrator/Supervisor","Other Healthcare"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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


extension PickListViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    
    //MARK:- PickerView Delegate & DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // self.txt_pickUpData.text = pickerData[row]
    }
    //MARK:- TextFiled Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // self.pickUp(txt_pickUpData)
    }
    
    
}


