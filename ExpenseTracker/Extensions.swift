//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Andres Bolivar on 1/5/23.
//

import Foundation
import SwiftUI

extension Color{
    static let background = Color("Background")
    static let text = Color("Text")
    static let icon = Color("Icon")
    static let systemBackgorund = Color(uiColor: .systemBackground)
}


extension DateFormatter{
    static let allNumericLatam: DateFormatter = {
        print("Initializing date formating")
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        return formatter
    }()
}

extension String{
    func dateParsed() -> Date{
        guard let parsedDate = DateFormatter.allNumericLatam.date(from: self) else {return Date()}
        return parsedDate
    }
}

extension Date: Strideable{
    func formatted() -> String {
        return self.formatted(.dateTime.year().month().day())
    }
}

extension Double{
    func roundedTo2Digits() -> Double{
        return (self * 100).rounded() / 100
        
    }
}
