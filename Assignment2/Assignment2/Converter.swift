//
//  Converter.swift
//  Assignment2
//
//  Created by Gopinath Nelluri on 3/5/17.
//  Copyright © 2017 Gopinath Nelluri. All rights reserved.
//

import Foundation
class Converter{
    
    let bSet:NSCharacterSet = NSCharacterSet(charactersIn: "23456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ!@#$%^&*()_={}[];':\"\\?/~`.,<>|€£¥•+-")
    
    let oSet:NSCharacterSet = NSCharacterSet(charactersIn: "89abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ!@#$%^&*()_={}[];':\"\\?/~`.,<>|€£¥•+-")
    
    let dSet:NSCharacterSet = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ!@#$%^&*()_={}[];':\"\\?/~`.,<>|€£¥•+-")
    
    let hSet:NSCharacterSet = NSCharacterSet(charactersIn: "ghijklmnopqrstuvwxyzGHIJKLKMNOPQRSTUVWXYZ!@#$%^&*()_={}[];':\"\\?/~`.,<>|€£¥•+-")
    
    
    func DtoB(_ b : Double) -> String {
        return String(Int(b), radix: 2).trimmingCharacters(in: bSet as CharacterSet).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    func DtoO(_ b : Double) -> String {
        return String(Int(b), radix: 8).trimmingCharacters(in: oSet as CharacterSet).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    func DtoD(_ b : Double) -> String {
        return String(Int(b), radix: 10).trimmingCharacters(in: dSet as CharacterSet).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    func DtoH(_ b : Double) -> String {
        return String(Int(b), radix: 16).trimmingCharacters(in: hSet as CharacterSet).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func BtoD(_ a: String) -> Double {
        let num = a.trimmingCharacters(in: bSet as CharacterSet).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return Double(Int(num, radix: 2)!)
    }
    func OtoD(_ a: String) -> Double {
        let num = a.trimmingCharacters(in: oSet as CharacterSet).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return Double(Int(num, radix: 8)!)
    }
    func DtoD(_ a: String) -> Double {
        let num = a.trimmingCharacters(in: dSet as CharacterSet).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return Double(Int(num, radix: 10)!)
    }
    func HtoD(_ a: String) -> Double {
        let num = a.trimmingCharacters(in: hSet as CharacterSet).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return Double(Int(num, radix: 16)!)
    }
    
    func updateToD(_ a: Int, _ input: String) -> Double{
        if a == 0 && input != "" {
            let data = input.trimmingCharacters(in: bSet as CharacterSet).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            if data != "" {
                return BtoD(data)
            }
        } else if a == 1 && input != "" {
            let data = input.trimmingCharacters(in: oSet as CharacterSet).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            if data != "" {
                return OtoD(data)
            }
            
        } else if a == 2 && input != "" {
            let data = input.trimmingCharacters(in: dSet as CharacterSet).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            if data != "" {
                return DtoD(data)
            }
            
        } else if a == 3 && input != "" {
            let data = input.trimmingCharacters(in: hSet as CharacterSet).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            if data != "" {
                return HtoD(data)
            }
            
        }
            return 0
    }
    
    func updateFormat(_ a: Int, _ d: Double) -> String{
        if a == 0 {
            return DtoB(d).uppercased()
        } else if a == 1 {
             return DtoO(d).uppercased()
        } else if a == 2 {
             return DtoD(d).uppercased()
        } else if a == 3 {
            return DtoH(d).uppercased()
        }
        return ""
    }
    
    func updateToS(_ a: Int, _ input: String, _ num: Double) -> String{
        if a == 0 && input != "" {
            let data = input.trimmingCharacters(in: bSet as CharacterSet).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            if data != "" {
                return DtoB(num).uppercased()
            }
        } else if a == 1 && input != "" {
            let data = input.trimmingCharacters(in: oSet as CharacterSet).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            if data != "" {
                return DtoO(num).uppercased()
            }
            
        } else if a == 2 && input != "" {
            let data = input.trimmingCharacters(in: dSet as CharacterSet).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            if data != "" {
                return DtoD(num).uppercased()
            }
            
        } else if a == 3 && input != "" {
            let data = input.trimmingCharacters(in: hSet as CharacterSet).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            if data != "" {
                return DtoH(num).uppercased()
            }
            
        }
        return ""
    }
    
}


/*
 
 @IBAction func stepper(_ sender: UIStepper) {
 
 if soption.selectedSegmentIndex == 0 {
 input.text! = String(Int(svalue.value), radix: 2).uppercased()
 } else if soption.selectedSegmentIndex == 1 {
 input.text! = String(Int(svalue.value), radix: 8).uppercased()
 } else if soption.selectedSegmentIndex == 2 {
 input.text! = String(Int(svalue.value), radix: 10).uppercased()
 } else if soption.selectedSegmentIndex == 3 {
 input.text! = String(Int(svalue.value), radix: 16).uppercased()
 }
 compute()
 }
 
 //inputChanged
 if soption.selectedSegmentIndex == 0 && input.text! != "" {
 svalue.value = convert.BtoD(input.text!)
 input.text! = convert.DtoB(svalue.value)
 } else if soption.selectedSegmentIndex == 1 && input.text! != "" {
 svalue.value = convert.OtoD(input.text!)
 input.text! = convert.DtoO(svalue.value)
 } else if soption.selectedSegmentIndex == 2 && input.text! != "" {
 svalue.value = convert.DtoD(input.text!)
 input.text! = convert.DtoD(svalue.value)
 } else if soption.selectedSegmentIndex == 3 && input.text! != "" {
 svalue.value = convert.HtoD(input.text!)
 input.text! = convert.DtoH(svalue.value)
 }
 else {
 svalue.value = 0
 }
 
 
 //stepper
 if soption.selectedSegmentIndex == 0 {
 input.text! = convert.DtoB(svalue.value)
 } else if soption.selectedSegmentIndex == 1 {
 input.text! = convert.DtoO(svalue.value)
 } else if soption.selectedSegmentIndex == 2 {
 input.text! = convert.DtoD(svalue.value)
 } else if soption.selectedSegmentIndex == 3 {
 input.text! = convert.DtoH(svalue.value)
 }
 
 */
