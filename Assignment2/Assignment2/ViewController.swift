//
//  ViewController.swift
//  Assignment2
//
//  Created by Gopinath Nelluri on 3/3/17.
//  Copyright © 2017 Gopinath Nelluri. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    var pickerDS = PickerDataSource()
    
    var convert =  Converter()
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var soption: UISegmentedControl!
    
    @IBOutlet weak var input: UITextField!
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var a: UILabel!
    
    @IBOutlet weak var b: UILabel!
    
    @IBOutlet weak var c: UILabel!
    
    @IBOutlet weak var d: UILabel!
    
    
    @IBOutlet weak var second: UIView!
    
    @IBOutlet weak var first: UIView!
    
    @IBOutlet weak var svalue: UIStepper!
    
    
    @IBAction func enter(_ sender: UIButton) {
        input.becomeFirstResponder()
        second.isHidden = false
        first.isHidden = true
        reset()
    }
    
    @IBAction func back(_ sender: UIButton) {
        first.isHidden = false
        second.isHidden = true
        
    }
    
    
    
    @IBAction func stepper(_ sender: UIStepper) {
        
        input.text! = convert.updateFormat(soption.selectedSegmentIndex, svalue.value)
        compute()
    }
    
    @IBAction func inputChanged(_ sender: UITextField) {
        input.text! = input.text!.uppercased()
        svalue.value = convert.updateToD(soption.selectedSegmentIndex, input.text!)
        input.text! = convert.updateToS(soption.selectedSegmentIndex, input.text!, svalue.value)
        
        compute()
    }
    
    
    @IBAction func soptionChanged(_ sender: UISegmentedControl) {
        reset()
    }
    
    func compute(){
        if input.text! != "" {
            if pickerValue == 0 {
                a.text! = "Binary: \(convert.DtoB(svalue.value))"
                a.isHidden = false
                b.isHidden = true
                c.isHidden = true
                d.isHidden = true
            } else if pickerValue == 1 {
                a.text! = "Octal: \(convert.DtoO(svalue.value))"
                a.isHidden = false
                b.isHidden = true
                c.isHidden = true
                d.isHidden = true
            
            } else if pickerValue == 2 {
                a.text! = "Decimal: \(convert.DtoD(svalue.value))"
                a.isHidden = false
                b.isHidden = true
                c.isHidden = true
                d.isHidden = true

            
            } else if pickerValue == 3 {
                a.text! = "Hex: \(convert.DtoH(svalue.value))"
                a.isHidden = false
                b.isHidden = true
                c.isHidden = true
                d.isHidden = true
            } else if pickerValue == 4 {
                a.text! = "Binary: \(convert.DtoB(svalue.value))"
                a.isHidden = false
                b.text! = "Octal: \(convert.DtoO(svalue.value))"
                b.isHidden = false
                c.text! = "Decimal: \(convert.DtoD(svalue.value))"
                c.isHidden = false
                d.text! = "Hex: \(convert.DtoH(svalue.value))"
                d.isHidden = false
            }
        } else {
            a.isHidden = true
            b.isHidden = true
            c.isHidden = true
            d.isHidden = true
        }
    }
    
    func reset(){
        input.text! = ""
        svalue.value = 0
        a.isHidden = true
        b.isHidden = true
        c.isHidden = true
        d.isHidden = true
        picker.selectRow(2, inComponent: 0, animated: true)
        pickerValue = 2
    }
    
    
    var pickerValue = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.animationImages = [UIImage(named: "img1.jpg")!,UIImage(named: "img2.jpg")!,UIImage(named: "img3.jpg")!,UIImage(named: "img4.jpg")!]
        imageView.animationDuration = 2.0
        imageView.startAnimating()
        self.picker.dataSource = self
        self.picker.delegate = self
        
        self.svalue.autorepeat = true
        self.svalue.wraps = true
        first.isHidden = false
        second.isHidden = true
        
        self.input.delegate = self
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDS.count()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDS.title(row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerValue = row
        compute()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.input {
            textField.resignFirstResponder()
        }
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.input.resignFirstResponder()
        self.view.endEditing(true)
    }
    
    
    
}

