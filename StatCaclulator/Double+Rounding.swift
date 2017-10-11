//
//  Double+Rounding.swift
//  StatCaclulator
//
//  Created by GIB on 7/26/16.
//  Copyright © 2016 Xmen. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    mutating func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return Darwin.round(self * divisor) / divisor
    }
}
