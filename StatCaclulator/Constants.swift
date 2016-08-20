//
//  Constants.swift
//  StatCaclulator
//
//  Created by GIB on 7/26/16.
//  Copyright © 2016 Xmen. All rights reserved.
//

import Foundation

public struct Constants {
    
    struct GNRC {
        static let ItemIndex = "kItemIndex"
        static let DataItem = "kDataItem"
    }
    
    struct NotificationKey {
        static let DeleteItem = "kDeleteItem"
        static let RefreshData = "kRefreshData"
        static let ClearData = "kClearData"
    }
    
    enum Operation: String {
        
        case Sum = "1"
        case Mean = "2"
        case MeanOfSquaredSum = "3"
        case Variance = "4"
        case StdDeviation = "5"
        case Median = "6"
        case Quartile = "7"
    }
}