import SwiftUI

// converter double para String
extension Double {
    func toString() -> String {
        String(format: "%.02f", self)
    }
}

//Example
let doubleValue = 45.89
let stringValue = doubleValue.toString()


// converter String para Date, e Date para String
extension String {
    func toDate(format: String) -> Date? {
        let df = DateFormatter()
        df.dateFormat = format
        return df.date(from: self)
    }
}

extension Date {
    func toString(format: String) -> String {
        let df = DateFormatter()
        df.dateFormat = format
        return df.string(from: self)
    }
}

//Example
let stringDate = "2021-06-30 15:00:00"
let date = stringDate.toDate(format: "yyyy-MM-dd HH:mm:ss")
let stringToDate = date?.toString(format: "yyyy-MM-dd HH:mm:ss")


