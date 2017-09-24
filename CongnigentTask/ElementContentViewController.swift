//
//  ElementContentViewController.swift
//  CongnigentTask
//
//  Created by vmoksha mobility on 21/09/17.
//  Copyright © 2017 saurabh suman. All rights reserved.
//

import UIKit

class ElementContentViewController: UIViewController {
    
    fileprivate var tableData :NSArray = []
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var checkBoxButton: UIButton!
    
    
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

    @IBAction func menuButtonAction(_ sender: Any) {
    }

    @IBAction func checkBoxButtonAction(_ sender: Any) {
    
       
    }
    
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController!) -> UIModalPresentationStyle{
        return .none
    }

    
    @IBAction func SwitchValueChange(_ sender: Any) {
        
        self .showUserAction(userString: "Switch ON/OFF Action")

    }

    @IBAction func datePickerValueChange(_ sender: Any) {
    
        print(datePicker.date);
       
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let dateStrng = formatter.string(from:datePicker.date)
        self .showUserAction(userString: dateStrng)

    }
    
}




extension ElementContentViewController {
    
    fileprivate func setup() {
        navigationController?.navigationBar.barTintColor = UIColor.colorWithHex(0x246E98)
        self.title = "Home"
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    fileprivate func showUserAction(userString:String){
        
        let alertView = UIAlertController.init(title: "User Action", message: userString, preferredStyle: .alert)
        let action = UIAlertAction.init(title: "OK", style: .default, handler: { (action) in
            
            alertView.dismiss(animated: true, completion: nil)
        })
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
        
    }

   
    
    fileprivate func showPopModel(){
 
    
    }
}

//MARK:- UITableViewDelegate, UITableViewDataSource

extension ElementContentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       // return tableData.count
    return 10
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath)
        let titlelabel = cell.viewWithTag(101) as? UILabel
        titlelabel?.text = "India"
        return cell
    }
    
    
}













