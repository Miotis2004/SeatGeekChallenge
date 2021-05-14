//
//  DateChanger.swift
//  SeatGeekChallenge
//
//  Created by Ronald Joubert on 5/13/21.
//

import Foundation

struct DateChanger {
    
    func stringToDate(dateString: String) -> String{
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-ddTHH:mm:ss"
        
        let newDate: Date = dateFormatter.date(from: dateString) ?? Date()
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "E dd MMM yyyy hh:mm"
        
        let newDateString: String = formatter.string(from: newDate)
        
        return newDateString
    }
    
    
}
