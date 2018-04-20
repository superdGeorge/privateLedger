//
//  DateUtil.swift
//  PriceTag
//
//  Created by George Zheng on 10/26/17.
//  Copyright © 2017 George Zheng. All rights reserved.
//

import Foundation

class DateUtil : NSObject{
    
    private static let currLocale:Locale = Locale.autoupdatingCurrent
    
    private static let mmddyyyyFormat:String = "MMMddYYYY"
    
    private static var dateFormatter:DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        
        formatter.locale = currLocale
        formatter.setLocalizedDateFormatFromTemplate(mmddyyyyFormat)
        
        return formatter
    }()
    
    
    static func getCurrentDate() -> String{
        return dateFormatter.string(from: Date())
    }
    
    
}
