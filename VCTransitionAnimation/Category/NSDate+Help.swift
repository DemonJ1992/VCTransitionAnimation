//
//  NSDate+Transform.swift
//  VCTransitionAnimation
//
//  Created by DuJian on 16/1/7.
//  Copyright © 2016年 du. All rights reserved.
//

import Foundation

extension NSDate {

    @nonobjc static let formatter : NSDateFormatter = {
        let value = NSDateFormatter()
        value.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return value
    }()
    
    static public func dateFromString(string : String) -> NSDate? {
        return formatter.dateFromString(string)
    }
    
    static public func stringFromDate(date : NSDate) -> String {
        return formatter.stringFromDate(date)
    }

    @nonobjc static let calendar : NSCalendar = {
        let value = NSCalendar.currentCalendar()
        return value
    }()
    
    static public func weekDayOfDate(date : NSDate) -> String {
        let arr = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"]
        let index = calendar.ordinalityOfUnit(NSCalendarUnit.Weekday, inUnit:NSCalendarUnit.WeekOfMonth, forDate:date)
        return arr[index-1]
    }
    
    static public func componentsFromDate(date : NSDate) -> NSDateComponents {
        return calendar.components([.Year, .Month, .Day, .WeekOfYear, .WeekOfMonth, .Weekday, .Hour, .Minute, .Second], fromDate: date)
    }
    
    static public func componentsFromDate(date : NSDate, toDate : NSDate) -> NSDateComponents {
        return calendar.components([.Year, .Month, .Day, .Hour, .Minute, .Second, .Nanosecond], fromDate: date, toDate: toDate, options: NSCalendarOptions.WrapComponents)
    }
}