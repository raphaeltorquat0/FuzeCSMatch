//
//  Date+Extensions.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 09/08/23.
//

import Foundation

extension Date {
    static let iso8601Formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()
    
    func formattedDate(with format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func formattedRelativeDate() -> String {
            let calendar = Calendar.current
            let _ = Date()
            
            if calendar.isDateInToday(self) {
                let timeFormatter = DateFormatter()
                timeFormatter.dateFormat = "HH:mm"
                let timeString = timeFormatter.string(from: self)
                return "Today \(timeString)"
            } else if calendar.isDateInTomorrow(self) {
                return "Tomorrow"
            } else {
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .medium
                return dateFormatter.string(from: self)
            }
        }
}








