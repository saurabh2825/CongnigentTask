//
//  DynamicUI.swift
//  CongnigentTask
//
//  Created by vmoksha mobility on 23/09/17.
//  Copyright © 2017 saurabh suman. All rights reserved.
//

import UIKit

class DynamicUI: NSObject {

    static func createUIButton()->UIButton
    {
        let button = UIButton()
        return button
    }
    static func createUILabel()->UILabel
    {
        let label = UILabel()
        return label
    }
    static func createUITextField()->UITextField
    {
        let textField = UITextField()
        //Border
        textField.layer.cornerRadius = 10.0;
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.gray.cgColor
        
        //Background
        textField.backgroundColor = UIColor(white: 1, alpha: 0.0)
        
        //Text
        textField.textColor = UIColor.black
        textField.textAlignment = NSTextAlignment.left
        
        return textField
    }
    static func createUIPickerView()->UIPickerView
    {
        let pickerView = UIPickerView()
        return pickerView
    }
    static func createUIView()->UIView
    {
        let view = UIView()
        return view
    }
    
    
    
}
