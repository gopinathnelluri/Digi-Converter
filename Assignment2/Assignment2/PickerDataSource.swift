//
//  PickerDataSource.swift
//  Assignment2
//
//  Created by Gopinath Nelluri on 3/4/17.
//  Copyright © 2017 Gopinath Nelluri. All rights reserved.
//

import Foundation

class PickerDataSource {
    var data = ["Display in Binary","Display in Octal","Display in Decimal","Display in Hexadecimal","Display in all four Basis"]
    func count() -> Int {
       return data.count
    }
    func title(_ a:Int) -> String {
        return data[a]
    }
}
