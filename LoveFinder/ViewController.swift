//
//  ViewController.swift
//  LoveFinder
//
//  Created by yzw on 16/7/14.
//  Copyright © 2016年 yzw. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var birthday: UIDatePicker!
    
    @IBOutlet weak var heightNumber: UISlider!

    @IBOutlet weak var height: UILabel!
    
    @IBOutlet weak var weightＮumber: UISlider!
    
    @IBOutlet weak var weight: UILabel!
    
    @IBOutlet weak var hasProperty: UISwitch!
    
    @IBOutlet weak var result: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        name.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder();
        return true;
    }
    
    
    @IBAction func heightChange(sender: AnyObject) {
        let slider = sender as! UISlider
        let i = Int(slider.value)
        slider.value = Float(i)
        height.text = "\(i)cm"
    }
    
    
    @IBAction func weightChange(sender: AnyObject) {
        let slider = sender as! UISlider
        let i = Int(slider.value)
        slider.value = Float(i)
        weight.text = "\(i)cm"
    }

    
    @IBAction func okTapped(sender: AnyObject) {
        let genderText = gender.selectedSegmentIndex==0 ? "高富帅":"白富美"
        let grogran = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let dateNow = NSDate()
        let component = grogran!.components(NSCalendarUnit.Year, fromDate: birthday.date, toDate: dateNow, options: NSCalendarOptions(rawValue: 0))
        let age = component.year
        let hasPropertyText = hasProperty.on ? "有房" : "没房"
        
        
        result.text = "\(name.text!)，\(age)岁, \(genderText),身高\(height.text!),体重\(weight.text!),\(hasPropertyText)，求交往"
    }

    
}

